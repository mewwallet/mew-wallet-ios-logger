//
//  File.swift
//  
//
//  Created by Mikhail Nikanorov on 3/12/23.
//

#if !canImport(os)

import Foundation
import Logging
#if canImport(LoggingSyslog)
import LoggingSyslog
#endif

struct LoggerFactory {
  static func factory(_ label: String) -> Logging.LogHandler {
#if DEBUG || !canImport(LoggingSyslog)
    return LogHandler.standardOutput(label: label)
#else
    return SyslogLogHandler(label: label)
#endif
  }
}

// Prevent name clashes
#if os(macOS) || os(tvOS) || os(iOS) || os(watchOS)
private let systemStderr = Darwin.stderr
private let systemStdout = Darwin.stdout
#elseif os(Windows)
private let systemStderr = CRT.stderr
private let systemStdout = CRT.stdout
#elseif canImport(Glibc)
private let systemStderr = Glibc.stderr!
private let systemStdout = Glibc.stdout!
#elseif canImport(WASILibc)
private let systemStderr = WASILibc.stderr!
private let systemStdout = WASILibc.stdout!
#else
#error("Unsupported runtime")
#endif


#if canImport(WASILibc) || os(Android)
private typealias CFilePointer = OpaquePointer
#else
private typealias CFilePointer = UnsafeMutablePointer<FILE>
#endif

// MARK: - LogHandler

private extension LoggerFactory {
  struct LogHandler: Logging.LogHandler {
#if compiler(>=5.6)
    internal typealias _SendableTextOutputStream = TextOutputStream & Sendable
#else
    internal typealias _SendableTextOutputStream = TextOutputStream
#endif
    
    /// Factory that makes a `StreamLogHandler` to directs its output to `stdout`
    public static func standardOutput(label: String) -> LogHandler {
      return LogHandler(label: label, stream: StdioOutputStream.stdout, metadataProvider: LoggingSystem.metadataProvider)
    }
    
    /// Factory that makes a `StreamLogHandler` that directs its output to `stdout`
    public static func standardOutput(label: String, metadataProvider: Logger.MetadataProvider?) -> LogHandler {
      return LogHandler(label: label, stream: StdioOutputStream.stdout, metadataProvider: metadataProvider)
    }
    
    /// Factory that makes a `StreamLogHandler` that directs its output to `stderr`
    public static func standardError(label: String) -> LogHandler {
      return LogHandler(label: label, stream: StdioOutputStream.stderr, metadataProvider: LoggingSystem.metadataProvider)
    }
    
    /// Factory that makes a `StreamLogHandler` that direct its output to `stderr`
    public static func standardError(label: String, metadataProvider: Logger.MetadataProvider?) -> LogHandler {
      return LogHandler(label: label, stream: StdioOutputStream.stderr, metadataProvider: metadataProvider)
    }
    
    private let stream: _SendableTextOutputStream
    private let label: String
    
    public var logLevel: Logger.Level = .info
    
    public var metadataProvider: Logger.MetadataProvider?
    
    private var prettyMetadata: String?
    public var metadata = Logger.Metadata() {
      didSet {
        self.prettyMetadata = self.prettify(self.metadata)
      }
    }
    
    public subscript(metadataKey metadataKey: String) -> Logger.Metadata.Value? {
      get {
        return self.metadata[metadataKey]
      }
      set {
        self.metadata[metadataKey] = newValue
      }
    }
    
    // internal for testing only
    internal init(label: String, stream: _SendableTextOutputStream) {
      self.init(label: label, stream: stream, metadataProvider: LoggingSystem.metadataProvider)
    }
    
    // internal for testing only
    internal init(label: String, stream: _SendableTextOutputStream, metadataProvider: Logger.MetadataProvider?) {
      self.label = label
      self.stream = stream
      self.metadataProvider = metadataProvider
    }
    
    public func log(level: Logger.Level,
                    message: Logger.Message,
                    metadata explicitMetadata: Logger.Metadata?,
                    source: String,
                    file: String,
                    function: String,
                    line: UInt) {
      let effectiveMetadata = Self.prepareMetadata(base: self.metadata, provider: self.metadataProvider, explicit: explicitMetadata)
      
      let prettyMetadata: String?
      if let effectiveMetadata = effectiveMetadata {
        prettyMetadata = effectiveMetadata.prettify
      } else {
        prettyMetadata = self.prettyMetadata
      }
      
      var stream = self.stream
      stream.write("\(self.timestamp()) \(self.label) :\(prettyMetadata.map { " \($0)" } ?? "") [\(source)] \(message)\n")
    }
    
    internal static func prepareMetadata(base: Logger.Metadata, provider: Logger.MetadataProvider?, explicit: Logger.Metadata?) -> Logger.Metadata? {
      var metadata = base
      
      let provided = provider?.get() ?? [:]
      
      guard !provided.isEmpty || !((explicit ?? [:]).isEmpty) else {
        // all per-log-statement values are empty
        return nil
      }
      
      if !provided.isEmpty {
        metadata.merge(provided, uniquingKeysWith: { _, provided in provided })
      }
      
      if let explicit = explicit, !explicit.isEmpty {
        metadata.merge(explicit, uniquingKeysWith: { _, explicit in explicit })
      }
      
      return metadata
    }
    
    private func prettify(_ metadata: Logger.Metadata) -> String? {
      if metadata.isEmpty {
        return nil
      } else {
        return metadata.lazy.sorted(by: { $0.key < $1.key }).map { "\($0)=\($1)" }.joined(separator: " ")
      }
    }
    
    private func timestamp() -> String {
      var buffer = [Int8](repeating: 0, count: 255)
#if os(Windows)
      var timestamp = __time64_t()
      _ = _time64(&timestamp)
      
      var localTime = tm()
      _ = _localtime64_s(&localTime, &timestamp)
      
      _ = strftime(&buffer, buffer.count, "%Y-%m-%dT%H:%M:%S%z", &localTime)
#else
      var timestamp = time(nil)
      let localTime = localtime(&timestamp)
      strftime(&buffer, buffer.count, "%Y-%m-%dT%H:%M:%S%z", localTime)
#endif
      return buffer.withUnsafeBufferPointer {
        $0.withMemoryRebound(to: CChar.self) {
          String(cString: $0.baseAddress!)
        }
      }
    }
  }
  
  /// A wrapper to facilitate `print`-ing to stderr and stdio that
  /// ensures access to the underlying `FILE` is locked to prevent
  /// cross-thread interleaving of output.
  struct StdioOutputStream: TextOutputStream {
    internal let file: CFilePointer
    internal let flushMode: FlushMode
    
    internal func write(_ string: String) {
      self.contiguousUTF8(string).withContiguousStorageIfAvailable { utf8Bytes in
#if os(Windows)
        _lock_file(self.file)
#elseif canImport(WASILibc)
        // no file locking on WASI
#else
        flockfile(self.file)
#endif
        defer {
#if os(Windows)
          _unlock_file(self.file)
#elseif canImport(WASILibc)
          // no file locking on WASI
#else
          funlockfile(self.file)
#endif
        }
        _ = fwrite(utf8Bytes.baseAddress!, 1, utf8Bytes.count, self.file)
        if case .always = self.flushMode {
          self.flush()
        }
      }!
    }
    
    /// Flush the underlying stream.
    /// This has no effect when using the `.always` flush mode, which is the default
    internal func flush() {
      _ = fflush(self.file)
    }
    
    internal func contiguousUTF8(_ string: String) -> String.UTF8View {
      var contiguousString = string
#if compiler(>=5.1)
      contiguousString.makeContiguousUTF8()
#else
      contiguousString = string + ""
#endif
      return contiguousString.utf8
    }
    
    /// Defines the flushing strategy for the underlying stream.
    internal enum FlushMode {
      case undefined
      case always
    }
    
    static let stderr = StdioOutputStream(file: systemStderr, flushMode: .always)
    static let stdout = StdioOutputStream(file: systemStdout, flushMode: .always)
  }
}

#endif
