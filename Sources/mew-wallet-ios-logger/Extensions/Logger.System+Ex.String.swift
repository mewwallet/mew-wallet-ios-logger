//
//  File.swift
//  
//
//  Created by Mikhail Nikanorov on 3/12/23.
//

import Foundation

public extension Logger.System {
  func traceEx(file: String = #fileID, line: Int = #line, function: String = #function, _ message: String, metadata: Logger.Metadata? = nil) {
#if DEBUG
    Logger.traceEx(self, file: file, line: line, function: function, message, metadata: metadata)
#endif
  }
  
  func debugEx(file: String = #fileID, line: Int = #line, function: String = #function, _ message: String, metadata: Logger.Metadata? = nil) {
#if DEBUG
    Logger.debugEx(self, file: file, line: line, function: function, message, metadata: metadata)
#endif
  }
  
  func infoEx(file: String = #fileID, line: Int = #line, function: String = #function, _ message: String, metadata: Logger.Metadata? = nil) {
#if DEBUG
    Logger.infoEx(self, file: file, line: line, function: function, message, metadata: metadata)
#endif
  }
  
  func noticeEx(file: String = #fileID, line: Int = #line, function: String = #function, _ message: String, metadata: Logger.Metadata? = nil) {
#if DEBUG
    Logger.noticeEx(self, file: file, line: line, function: function, message, metadata: metadata)
#endif
  }
  
  func warningEx(file: String = #fileID, line: Int = #line, function: String = #function, _ message: String, metadata: Logger.Metadata? = nil) {
    Logger.warningEx(self, file: file, line: line, function: function, message, metadata: metadata)
  }
  
  func errorEx(file: String = #fileID, line: Int = #line, function: String = #function, _ message: String, metadata: Logger.Metadata? = nil) {
    Logger.errorEx(self, file: file, line: line, function: function, message, metadata: metadata)
  }
  
  func criticalEx(file: String = #fileID, line: Int = #line, function: String = #function, _ message: String, metadata: Logger.Metadata? = nil) {
    Logger.criticalEx(self, file: file, line: line, function: function, message, metadata: metadata)
  }
}
