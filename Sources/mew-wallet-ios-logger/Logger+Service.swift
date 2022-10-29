//
//  File.swift
//  
//
//  Created by Mikhail Nikanorov on 10/28/22.
//

import Foundation
import os

extension Logger {
  public struct System {
    public enum Level: UInt8, Comparable {
      case trace      = 0
      case debug      = 1
      case info       = 2
      case notice     = 3
      case warning    = 4
      case error      = 5
      case critical   = 6
      public static func < (lhs: Logger.System.Level, rhs: Logger.System.Level) -> Bool {
        lhs.rawValue < rhs.rawValue
      }
    }
    
    let subsystem: String
    let category: String
    var level: Level = .warning
    
    public static func with(subsystem: String, category: String, level: Level = .warning) -> System {
      let system = System(subsystem: subsystem, category: category, level: level)
      return system
    }
    
    public mutating func level(_ level: Level) {
      self.level = level
    }
  }
  
  private static func `for`(_ system: Logger.System) -> Logger {
    return Logger(subsystem: system.subsystem, category: system.category)
  }
  
  // MARK: - Logger + Convenient
  
  // MARK: Looger + Error
  public static func trace(_ system: Logger.System, _ error: Error)        {
#if DEBUG
    guard system.level <= .trace else { return }
    Logger.for(system).trace(error: error)
#endif
  }
  
  public static func debug(_ system: Logger.System, _ error: Error)        {
#if DEBUG
    guard system.level <= .debug else { return }
    Logger.for(system).debug(error: error)
#endif
  }
  
  public static func info(_ system: Logger.System, _ error: Error)         {
#if DEBUG
    guard system.level <= .info else { return }
    Logger.for(system).info(error: error)
#endif
  }
  
  public static func notice(_ system: Logger.System, _ error: Error)       {
#if DEBUG
    guard system.level <= .notice else { return }
    Logger.for(system).notice(error: error)
#endif
  }
  
  public static func warning(_ system: Logger.System, _ error: Error)      {
#if DEBUG
    guard system.level <= .warning else { return }
    Logger.for(system).warning(error: error)
#endif
  }
  
  public static func error(_ system: Logger.System, _ error: Error)        {
#if DEBUG
    guard system.level <= .error else { return }
    Logger.for(system).error(error: error)
#endif
  }
  
  public static func critical(_ system: Logger.System, _ error: Error)     {
#if DEBUG
    guard system.level <= .critical else { return }
    Logger.for(system).critical(error: error)
#endif
  }
  
  // MARK: Logger + Message
  
  public static func trace(_ system: Logger.System, _ message: String)     {
#if DEBUG
    guard system.level <= .trace else { return }
    Logger.for(system).trace(message: message)
#endif
  }
  
  public static func debug(_ system: Logger.System, _ message: String)     {
#if DEBUG
    guard system.level <= .debug else { return }
    Logger.for(system).debug(message: message)
#endif
  }
  
  public static func info(_ system: Logger.System, _ message: String)      {
#if DEBUG
    guard system.level <= .info else { return }
    Logger.for(system).info(message: message)
#endif
  }
  
  public static func notice(_ system: Logger.System, _ message: String)    {
#if DEBUG
    guard system.level <= .notice else { return }
    Logger.for(system).notice(message: message)
#endif
  }
  
  public static func warning(_ system: Logger.System, _ message: String)   {
#if DEBUG
    guard system.level <= .warning else { return }
    Logger.for(system).warning(message: message)
#endif
  }
  
  public static func error(_ system: Logger.System, _ message: String)     {
#if DEBUG
    guard system.level <= .error else { return }
    Logger.for(system).error(message: message)
#endif
  }
  
  public static func critical(_ system: Logger.System, _ message: String)  {
#if DEBUG
    guard system.level <= .critical else { return }
    Logger.for(system).critical(message: message)
#endif
  }
  
  // MARK: Extented Logger + Error
  
  public static func trace(system: Logger.System, file: String = #fileID, line: Int = #line, function: String = #function, _ error: Error)         {
#if DEBUG
    guard system.level <= .trace else { return }
    Logger.for(system).trace(file: file, line: line, function: function, message: error.localizedDescription)
#endif
  }
  
  public static func debug(system: Logger.System, file: String = #fileID, line: Int = #line, function: String = #function, _ error: Error)         {
#if DEBUG
    guard system.level <= .debug else { return }
    Logger.for(system).debug(file: file, line: line, function: function, message: error.localizedDescription)
#endif
  }
  
  public static func info(system: Logger.System, file: String = #fileID, line: Int = #line, function: String = #function, _ error: Error)          {
#if DEBUG
    guard system.level <= .info else { return }
    Logger.for(system).info(file: file, line: line, function: function, message: error.localizedDescription)
#endif
  }
  
  public static func notice(system: Logger.System, file: String = #fileID, line: Int = #line, function: String = #function, _ error: Error)        {
#if DEBUG
    guard system.level <= .notice else { return }
    Logger.for(system).notice(file: file, line: line, function: function, message: error.localizedDescription)
#endif
  }
  
  public static func warning(system: Logger.System, file: String = #fileID, line: Int = #line, function: String = #function, _ error: Error)       {
#if DEBUG
    guard system.level <= .warning else { return }
    Logger.for(system).warning(file: file, line: line, function: function, message: error.localizedDescription)
#endif
  }
  
  public static func error(system: Logger.System, file: String = #fileID, line: Int = #line, function: String = #function, _ error: Error)         {
#if DEBUG
    guard system.level <= .error else { return }
    Logger.for(system).error(file: file, line: line, function: function, message: error.localizedDescription)
#endif
  }
  
  public static func critical(system: Logger.System, file: String = #fileID, line: Int = #line, function: String = #function, _ error: Error)      {
#if DEBUG
    guard system.level <= .critical else { return }
    Logger.for(system).critical(file: file, line: line, function: function, message: error.localizedDescription)
#endif
  }
  
  
  // MARK: Extented Logger + Message
  
  public static func trace(system: Logger.System, file: String = #fileID, line: Int = #line, function: String = #function, _ message: String)      {
#if DEBUG
    guard system.level <= .trace else { return }
    Logger.for(system).trace(file: file, line: line, function: function, message: message)
#endif
  }
  
  public static func debug(system: Logger.System, file: String = #fileID, line: Int = #line, function: String = #function, _ message: String)      {
#if DEBUG
    guard system.level <= .debug else { return }
    Logger.for(system).debug(file: file, line: line, function: function, message: message)
#endif
  }
  
  public static func info(system: Logger.System, file: String = #fileID, line: Int = #line, function: String = #function, _ message: String)       {
#if DEBUG
    guard system.level <= .info else { return }
    Logger.for(system).info(file: file, line: line, function: function, message: message)
#endif
  }
  
  public static func notice(system: Logger.System, file: String = #fileID, line: Int = #line, function: String = #function, _ message: String)     {
#if DEBUG
    guard system.level <= .notice else { return }
    Logger.for(system).notice(file: file, line: line, function: function, message: message)
#endif
  }
  
  public static func warning(system: Logger.System, file: String = #fileID, line: Int = #line, function: String = #function, _ message: String)    {
#if DEBUG
    guard system.level <= .warning else { return }
    Logger.for(system).warning(file: file, line: line, function: function, message: message)
#endif
  }
  
  public static func error(system: Logger.System, file: String = #fileID, line: Int = #line, function: String = #function, _ message: String)      {
#if DEBUG
    guard system.level <= .error else { return }
    Logger.for(system).error(file: file, line: line, function: function, message: message)
#endif
  }
  
  public static func critical(system: Logger.System, file: String = #fileID, line: Int = #line, function: String = #function, _ message: String)   {
#if DEBUG
    guard system.level <= .critical else { return }
    Logger.for(system).critical(file: file, line: line, function: function, message: message)
#endif
  }
}
