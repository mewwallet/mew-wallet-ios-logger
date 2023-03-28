//
//  File.swift
//  
//
//  Created by Mikhail Nikanorov on 3/12/23.
//

import Foundation

public extension Logger {
  static func traceEx(_ system: Logger.System, file: String = #fileID, line: Int = #line, function: String = #function, _ message: String, metadata: Logger.Metadata? = nil) {
#if DEBUG
    guard system.level <= .trace else { return }
    Logger.for(system).trace(file: file, line: line, function: function, message: message, metadata: metadata)
#endif
  }
  
  static func debugEx(_ system: Logger.System, file: String = #fileID, line: Int = #line, function: String = #function, _ message: String, metadata: Logger.Metadata? = nil) {
#if DEBUG
    guard system.level <= .debug else { return }
    Logger.for(system).debug(file: file, line: line, function: function, message: message, metadata: metadata)
#endif
  }
  
  static func infoEx(_ system: Logger.System, file: String = #fileID, line: Int = #line, function: String = #function, _ message: String, metadata: Logger.Metadata? = nil) {
#if DEBUG
    guard system.level <= .info else { return }
    Logger.for(system).info(file: file, line: line, function: function, message: message, metadata: metadata)
#endif
  }
  
  static func noticeEx(_ system: Logger.System, file: String = #fileID, line: Int = #line, function: String = #function, _ message: String, metadata: Logger.Metadata? = nil) {
#if DEBUG
    guard system.level <= .notice else { return }
    Logger.for(system).notice(file: file, line: line, function: function, message: message, metadata: metadata)
#endif
  }
  
  static func warningEx(_ system: Logger.System, file: String = #fileID, line: Int = #line, function: String = #function, _ message: String, metadata: Logger.Metadata? = nil) {
    guard system.level <= .warning else { return }
    Logger.for(system).warning(file: file, line: line, function: function, message: message, metadata: metadata)
  }
  
  static func errorEx(_ system: Logger.System, file: String = #fileID, line: Int = #line, function: String = #function, _ message: String, metadata: Logger.Metadata? = nil) {
    guard system.level <= .error else { return }
    Logger.for(system).error(file: file, line: line, function: function, message: message, metadata: metadata)
  }
  
  static func criticalEx(_ system: Logger.System, file: String = #fileID, line: Int = #line, function: String = #function, _ message: String, metadata: Logger.Metadata? = nil) {
    guard system.level <= .critical else { return }
    Logger.for(system).critical(file: file, line: line, function: function, message: message, metadata: metadata)
  }
}
