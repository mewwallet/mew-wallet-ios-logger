import Foundation
import os

public extension Logger {
  func trace(error: Error) {
#if DEBUG
    self.trace(message: error.localizedDescription)
#endif
  }
  
  func debug(error: Error) {
#if DEBUG
    self.debug(message: error.localizedDescription)
#endif
  }
  
  func info(error: Error) {
#if DEBUG
    self.info(message: error.localizedDescription)
#endif
  }
  
  func notice(error: Error) {
#if DEBUG
    self.notice(message: error.localizedDescription)
#endif
  }
  
  func warning(error: Error) {
#if DEBUG
    self.warning(message: error.localizedDescription)
#endif
  }
  
  func error(error: Error) {
#if DEBUG
    self.error(message: error.localizedDescription)
#endif
  }
  
  func critical(error: Error) {
#if DEBUG
    self.critical(message: error.localizedDescription)
#endif
  }
  
  func trace(message: String) {
#if DEBUG
    self.trace("[T]⬜️ \(message)")
#endif
  }
  
  func debug(message: String) {
#if DEBUG
    self.debug("[D]🟪 \(message)")
#endif
  }
  
  func info(message: String) {
#if DEBUG
    self.info("[I]🟦 \(message)")
#endif
  }
  
  func notice(message: String) {
#if DEBUG
    self.notice("[N]🟩 \(message)")
#endif
  }
  
  func warning(message: String) {
#if DEBUG
    self.warning("[W]🟨 \(message)")
#endif
  }
  
  func error(message: String) {
#if DEBUG
    self.error("[E]🟧 \(message)")
#endif
  }
  
  func critical(message: String) {
#if DEBUG
    self.critical("[C]🟥 \(message)")
#endif
  }
  
  func trace(file: String, line: Int, function: String, _ error: Error) {
#if DEBUG
    self.trace(file: file, line: line, function: function, message: error.localizedDescription)
#endif
  }
  
  func debug(file: String, line: Int, function: String, _ error: Error) {
#if DEBUG
    self.debug(file: file, line: line, function: function, message: error.localizedDescription)
#endif
  }
  
  func info(file: String, line: Int, function: String, _ error: Error) {
#if DEBUG
    self.info(file: file, line: line, function: function, message: error.localizedDescription)
#endif
  }
  
  func notice(file: String, line: Int, function: String, _ error: Error) {
#if DEBUG
    self.notice(file: file, line: line, function: function, message: error.localizedDescription)
#endif
  }
  
  func warning(file: String, line: Int, function: String, _ error: Error) {
#if DEBUG
    self.warning(file: file, line: line, function: function, message: error.localizedDescription)
#endif
  }
  
  func error(file: String, line: Int, function: String, _ error: Error) {
#if DEBUG
    self.error(file: file, line: line, function: function, message: error.localizedDescription)
#endif
  }
  
  func critical(file: String, line: Int, function: String, _ error: Error) {
#if DEBUG
    self.critical(file: file, line: line, function: function, message: error.localizedDescription)
#endif
  }
  
  func trace(file: String, line: Int, function: String, message: String) {
#if DEBUG
    self.trace("[T]⬜️ \(file):\(function):\(line) \(message)")
#endif
  }
  
  func debug(file: String, line: Int, function: String, message: String) {
#if DEBUG
    self.debug("[D]🟪 \(file):\(function):\(line) \(message)")
#endif
  }
  
  func info(file: String, line: Int, function: String, message: String) {
#if DEBUG
    self.info("[I]🟦 \(file):\(function):\(line) \(message)")
#endif
  }
  
  func notice(file: String, line: Int, function: String, message: String) {
#if DEBUG
    self.notice("[N]🟩 \(file):\(function):\(line) \(message)")
#endif
  }
  
  func warning(file: String, line: Int, function: String, message: String) {
#if DEBUG
    self.warning("[W]🟨 \(file):\(function):\(line) \(message)")
#endif
  }
  
  func error(file: String, line: Int, function: String, message: String) {
#if DEBUG
    self.error("[E]🟧 \(file):\(function):\(line) \(message)")
#endif
  }
  
  func critical(file: String, line: Int, function: String, message: String) {
#if DEBUG
    self.critical("[C]🟥 \(file):\(function):\(line) \(message)")
#endif
  }
}

