import Foundation
#if canImport(os)
import os
#endif

public extension Logger {
  func trace(error: (any Error)?, metadata: Metadata? = nil) {
#if DEBUG
    self.trace(message: error?.localizedDescription ?? "<no error>", metadata: metadata)
#endif
  }
  
  func debug(error: (any Error)?, metadata: Metadata? = nil) {
#if DEBUG
    self.debug(message: error?.localizedDescription ?? "<no error>", metadata: metadata)
#endif
  }
  
  func info(error: (any Error)?, metadata: Metadata? = nil) {
#if DEBUG
    self.info(message: error?.localizedDescription ?? "<no error>", metadata: metadata)
#endif
  }
  
  func notice(error: (any Error)?, metadata: Metadata? = nil) {
#if DEBUG
    self.notice(message: error?.localizedDescription ?? "<no error>", metadata: metadata)
#endif
  }
  
  func warning(error: (any Error)?, metadata: Metadata? = nil) {
    self.warning(message: error?.localizedDescription ?? "<no error>", metadata: metadata)
  }
  
  func error(error: (any Error)?, metadata: Metadata? = nil) {
    self.error(message: error?.localizedDescription ?? "<no error>", metadata: metadata)
  }
  
  func critical(error: (any Error)?, metadata: Metadata? = nil) {
    self.critical(message: error?.localizedDescription ?? "<no error>", metadata: metadata)
  }
  
  func trace(message: String?, metadata: Metadata? = nil) {
#if DEBUG
    if let metadata = metadata?.prettify {
      self.trace("[T]⬜️ [\(metadata)] \(message ?? "<no message>")")
    } else {
      self.trace("[T]⬜️ \(message ?? "<no message>")")
    }
#endif
  }
  
  func debug(message: String?, metadata: Metadata? = nil) {
#if DEBUG
    if let metadata = metadata?.prettify {
      self.debug("[D]🟪 [\(metadata)] \(message ?? "<no message>")")
    } else {
      self.debug("[D]🟪 \(message ?? "<no message>")")
    }
#endif
  }
  
  func info(message: String?, metadata: Metadata? = nil) {
#if DEBUG
    if let metadata = metadata?.prettify {
      self.info("[I]🟦 [\(metadata)] \(message ?? "<no message>")")
    } else {
      self.info("[I]🟦 \(message ?? "<no message>")")
    }
#endif
  }
  
  func notice(message: String?, metadata: Metadata? = nil) {
#if DEBUG
    if let metadata = metadata?.prettify {
      self.notice("[N]🟩 [\(metadata)] \(message ?? "<no message>")")
    } else {
      self.notice("[N]🟩 \(message ?? "<no message>")")
    }
#endif
  }
  
  func warning(message: String?, metadata: Metadata? = nil) {
    if let metadata = metadata?.prettify {
      self.warning("[W]🟨 [\(metadata)] \(message ?? "<no message>")")
    } else {
      self.warning("[W]🟨 \(message ?? "<no message>")")
    }
  }
  
  func error(message: String?, metadata: Metadata? = nil) {
    if let metadata = metadata?.prettify {
      self.error("[E]🟧 [\(metadata)] \(message ?? "<no message>")")
    } else {
      self.error("[E]🟧 \(message ?? "<no message>")")
    }
  }
  
  func critical(message: String?, metadata: Metadata? = nil) {
    if let metadata = metadata?.prettify {
      self.critical("[C]🟥 [\(metadata)] \(message ?? "<no message>")")
    } else {
      self.critical("[C]🟥 \(message ?? "<no message>")")
    }
  }
  
  func trace(file: String, line: Int, function: String, _ error: Error, metadata: Metadata? = nil) {
#if DEBUG
    self.trace(file: file, line: line, function: function, message: error.localizedDescription)
#endif
  }
  
  func debug(file: String, line: Int, function: String, _ error: Error, metadata: Metadata? = nil) {
#if DEBUG
    self.debug(file: file, line: line, function: function, message: error.localizedDescription)
#endif
  }
  
  func info(file: String, line: Int, function: String, _ error: Error, metadata: Metadata? = nil) {
#if DEBUG
    self.info(file: file, line: line, function: function, message: error.localizedDescription)
#endif
  }
  
  func notice(file: String, line: Int, function: String, _ error: Error, metadata: Metadata? = nil) {
#if DEBUG
    self.notice(file: file, line: line, function: function, message: error.localizedDescription)
#endif
  }
  
  func warning(file: String, line: Int, function: String, _ error: Error, metadata: Metadata? = nil) {
    self.warning(file: file, line: line, function: function, message: error.localizedDescription)
  }
  
  func error(file: String, line: Int, function: String, _ error: Error, metadata: Metadata? = nil) {
    self.error(file: file, line: line, function: function, message: error.localizedDescription)
  }
  
  func critical(file: String, line: Int, function: String, _ error: Error, metadata: Metadata? = nil) {
    self.critical(file: file, line: line, function: function, message: error.localizedDescription)
  }
  
  func trace(file: String, line: Int, function: String, message: String, metadata: Metadata? = nil) {
#if DEBUG
    if let metadata = metadata?.prettify {
      self.trace("[T]⬜️ [\(metadata)] \(file):\(function):\(line) \(message)")
    } else {
      self.trace("[T]⬜️ \(file):\(function):\(line) \(message)")
    }
#endif
  }
  
  func debug(file: String, line: Int, function: String, message: String, metadata: Metadata? = nil) {
#if DEBUG
    if let metadata = metadata?.prettify {
      self.debug("[D]🟪 [\(metadata)] \(file):\(function):\(line) \(message)")
    } else {
      self.debug("[D]🟪 \(file):\(function):\(line) \(message)")
    }
#endif
  }
  
  func info(file: String, line: Int, function: String, message: String, metadata: Metadata? = nil) {
#if DEBUG
    if let metadata = metadata?.prettify {
      self.info("[I]🟦 [\(metadata)] \(file):\(function):\(line) \(message)")
    } else {
      self.info("[I]🟦 \(file):\(function):\(line) \(message)")
    }
#endif
  }
  
  func notice(file: String, line: Int, function: String, message: String, metadata: Metadata? = nil) {
#if DEBUG
    if let metadata = metadata?.prettify {
      self.notice("[N]🟩 [\(metadata)] \(file):\(function):\(line) \(message)")
    } else {
      self.notice("[N]🟩 \(file):\(function):\(line) \(message)")
    }
#endif
  }
  
  func warning(file: String, line: Int, function: String, message: String, metadata: Metadata? = nil) {
    if let metadata = metadata?.prettify {
      self.warning("[W]🟨 [\(metadata)] \(file):\(function):\(line) \(message)")
    } else {
      self.warning("[W]🟨 \(file):\(function):\(line) \(message)")
    }
  }
  
  func error(file: String, line: Int, function: String, message: String, metadata: Metadata? = nil) {
    if let metadata = metadata?.prettify {
      self.error("[E]🟧 [\(metadata)] \(file):\(function):\(line) \(message)")
    } else {
      self.error("[E]🟧 \(file):\(function):\(line) \(message)")
    }
  }
  
  func critical(file: String, line: Int, function: String, message: String, metadata: Metadata? = nil) {
    if let metadata = metadata?.prettify {
      self.critical("[C]🟥 [\(metadata)] \(file):\(function):\(line) \(message)")
    } else {
      self.critical("[C]🟥 \(file):\(function):\(line) \(message)")
    }
  }
}

