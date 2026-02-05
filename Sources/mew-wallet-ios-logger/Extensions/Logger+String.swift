//
//  File.swift
//  
//
//  Created by Mikhail Nikanorov on 3/12/23.
//

import Foundation
#if canImport(os)
  import os
#else
  import Logging
#endif

public extension Logger {
  static func trace(_ system: Logger.System, _ message: String?, metadata: Logger.Metadata? = nil) {
#if DEBUG
    guard system.level <= .trace else { return }
    Logger.for(system).trace(message: message, metadata: metadata)
#endif
  }
  
  static func debug(_ system: Logger.System, _ message: String?, metadata: Metadata? = nil) {
#if DEBUG
    guard system.level <= .debug else { return }
    Logger.for(system).debug(message: message, metadata: metadata)
#endif
  }
  
  static func info(_ system: Logger.System, _ message: String?, metadata: Logger.Metadata? = nil) {
#if DEBUG
    guard system.level <= .info else { return }
    Logger.for(system).info(message: message, metadata: metadata)
#endif
  }
  
  static func notice(_ system: Logger.System, _ message: String?, metadata: Logger.Metadata? = nil) {
#if DEBUG
    guard system.level <= .notice else { return }
    Logger.for(system).notice(message: message, metadata: metadata)
#endif
  }
  
  static func warning(_ system: Logger.System, _ message: String?, metadata: Logger.Metadata? = nil) {
    guard system.level <= .warning else { return }
    Logger.for(system).warning(message: message, metadata: metadata)
  }
  
  static func error(_ system: Logger.System, _ message: String?, metadata: Logger.Metadata? = nil) {
    guard system.level <= .error else { return }
    Logger.for(system).error(message: message, metadata: metadata)
  }
  
  static func critical(_ system: Logger.System, _ message: String?, metadata: Logger.Metadata? = nil) {
    guard system.level <= .critical else { return }
    Logger.for(system).critical(message: message, metadata: metadata)
  }
}
