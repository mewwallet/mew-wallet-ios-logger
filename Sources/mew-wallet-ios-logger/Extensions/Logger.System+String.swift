//
//  File.swift
//  
//
//  Created by Mikhail Nikanorov on 3/12/23.
//

import Foundation

public extension Logger.System {
  func trace(_ message: String, metadata: Logger.Metadata? = nil) {
#if DEBUG
    Logger.trace(self, message, metadata: metadata)
#endif
  }
  
  func debug(_ message: String, metadata: Logger.Metadata? = nil) {
#if DEBUG
    Logger.debug(self, message, metadata: metadata)
#endif
  }
  
  func info(_ message: String, metadata: Logger.Metadata? = nil) {
#if DEBUG
    Logger.info(self, message, metadata: metadata)
#endif
  }
  
  func notice(_ message: String, metadata: Logger.Metadata? = nil) {
#if DEBUG
    Logger.notice(self, message, metadata: metadata)
#endif
  }
  
  func warning(_ message: String, metadata: Logger.Metadata? = nil) {
    Logger.warning(self, message, metadata: metadata)
  }
  
  func error(_ message: String, metadata: Logger.Metadata? = nil) {
    Logger.error(self, message, metadata: metadata)
  }
  
  func critical(_ message: String, metadata: Logger.Metadata? = nil) {
    Logger.critical(self, message, metadata: metadata)
  }
}
