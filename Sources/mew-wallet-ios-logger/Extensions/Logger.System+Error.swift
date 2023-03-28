//
//  File.swift
//  
//
//  Created by Mikhail Nikanorov on 3/12/23.
//

import Foundation

public extension Logger.System {
  func trace(_ error: Error, metadata: Logger.Metadata? = nil) {
#if DEBUG
    self.trace(error.localizedDescription, metadata: metadata)
#endif
  }

  func debug(_ error: Error, metadata: Logger.Metadata? = nil) {
#if DEBUG
    self.debug(error.localizedDescription, metadata: metadata)
#endif
  }
  
  func info(_ error: Error, metadata: Logger.Metadata? = nil) {
#if DEBUG
    self.info(error.localizedDescription, metadata: metadata)
#endif
  }
  
  func notice(_ error: Error, metadata: Logger.Metadata? = nil) {
#if DEBUG
    self.notice(error.localizedDescription, metadata: metadata)
#endif
  }
  
  func warning(_ error: Error, metadata: Logger.Metadata? = nil) {
    self.warning(error.localizedDescription, metadata: metadata)
  }
  
  func error(_ error: Error, metadata: Logger.Metadata? = nil) {
    self.error(error.localizedDescription, metadata: metadata)
  }
  
  func critical(_ error: Error, metadata: Logger.Metadata? = nil) {
    self.critical(error.localizedDescription, metadata: metadata)
  }
}
