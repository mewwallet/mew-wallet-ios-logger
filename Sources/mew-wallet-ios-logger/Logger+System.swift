//
//  File.swift
//  
//
//  Created by Mikhail Nikanorov on 10/28/22.
//

import Foundation
import Logging
#if canImport(os)
import os
#endif

extension Logger {
  public typealias Level = Logging.Logger.Level
  public typealias Metadata = Logging.Logger.Metadata
  public typealias Message = Logging.Logger.Message
  
  public struct System {
    let subsystem: String
    let category: String
    var level: Level = .warning
    
    public static func with(subsystem: String, category: String, level: Logger.Level = .warning) -> System {
      let system = System(subsystem: subsystem, category: category, level: level)
      return system
    }
    
    public mutating func level(_ level: Logger.Level) {
      #if !DEBUG
      let level = max(level, .warning)
      #endif
      self.level = level
    }
  }
  
  internal static func `for`(_ system: Logger.System) -> Logger {
    #if canImport(os)
    return Logger(subsystem: system.subsystem, category: system.category)
    #else
    var logger = Logger(label: "[\(system.subsystem):\(system.category)]", factory: LoggerFactory.factory)
    logger.logLevel = system.level
    return logger
    #endif
  }
}
