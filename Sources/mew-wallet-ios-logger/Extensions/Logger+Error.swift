//
//  File.swift
//  
//
//  Created by Mikhail Nikanorov on 3/12/23.
//

import Foundation

public extension Logger {
  static func trace(_ system: Logger.System, _ error: Error, metadata: Logger.Metadata? = nil) {
#if DEBUG
    guard system.level <= .trace else { return }
    Logger.for(system).trace(error: error, metadata: metadata)
#endif
  }
  
  static func debug(_ system: Logger.System, _ error: Error, metadata: Logger.Metadata? = nil) {
#if DEBUG
    guard system.level <= .debug else { return }
    Logger.for(system).debug(error: error, metadata: metadata)
#endif
  }
  
  static func info(_ system: Logger.System, _ error: Error, metadata: Logger.Metadata? = nil) {
#if DEBUG
    guard system.level <= .info else { return }
    Logger.for(system).info(error: error, metadata: metadata)
#endif
  }
  
  static func notice(_ system: Logger.System, _ error: Error, metadata: Logger.Metadata? = nil) {
#if DEBUG
    guard system.level <= .notice else { return }
    Logger.for(system).notice(error: error, metadata: metadata)
#endif
  }
  
  static func warning(_ system: Logger.System, _ error: Error, metadata: Logger.Metadata? = nil) {
    guard system.level <= .warning else { return }
    Logger.for(system).warning(error: error, metadata: metadata)
  }
  
  static func error(_ system: Logger.System, _ error: Error, metadata: Logger.Metadata? = nil) {
    guard system.level <= .error else { return }
    Logger.for(system).error(error: error, metadata: metadata)
  }
  
  static func critical(_ system: Logger.System, _ error: Error, metadata: Logger.Metadata? = nil) {
    guard system.level <= .critical else { return }
    Logger.for(system).critical(error: error, metadata: metadata)
  }
}
