//
//  BaseTests.swift
//  
//
//  Created by Mikhail Nikanorov on 3/12/23.
//

import XCTest
import mew_wallet_ios_logger

#if canImport(os)
  import os
#else
  import Logging
#endif

fileprivate extension Logger.System {
  static let extensionLogger = Logger.System.with(subsystem: "extension system", category: "extension category")
}

final class BaseTests: XCTestCase {
  func testBasicUsage() throws {
    let logger = Logger.System.with(subsystem: "basic system", category: "basic category")
    
    logger.level(.debug)
    
    enum TestError: LocalizedError {
      case testError
      
      var errorDescription: String? {
        return "Localized description"
      }
    }
    
    let error: Error = TestError.testError
    
    logger.trace(error)
    logger.debug(error)
    logger.info(error)
    
    logger.level(.notice)
    logger.trace(error)
    logger.debug(error)
    logger.info(error)
    
    logger.notice(error)
    logger.warning(error)
    logger.error(error)
    logger.critical(error)
    
    logger.traceEx(error)
    logger.debugEx(error)
    logger.infoEx(error)
    logger.noticeEx(error)
    logger.warningEx(error)
    logger.errorEx(error)
    logger.criticalEx(error)
    
    logger.traceEx(error, metadata: ["some":"x"])
    logger.debugEx(error, metadata: ["some":"x"])
    logger.infoEx(error, metadata: ["some":"x"])
    logger.noticeEx(error, metadata: ["some":"x"])
    logger.warningEx(error, metadata: ["some":"x"])
    logger.errorEx(error, metadata: ["some":"x"])
    logger.criticalEx(error, metadata: ["some":"x"])
  }
  
  func testExtensionUsage() throws {
    Logger.System.extensionLogger.level(.debug)
    Logger.debug(.extensionLogger, "=== Debug visibility ===")
    Logger.debug(.extensionLogger, "=== 3 messages: ===")
    
    enum TestError: LocalizedError {
      case testError
      
      var errorDescription: String? {
        return "Localized description"
      }
    }
    
    let error: Error = TestError.testError
    
    Logger.trace(.extensionLogger, error)
    Logger.debug(.extensionLogger, error)
    Logger.info(.extensionLogger, error)
    
    Logger.System.extensionLogger.level(.notice)
    Logger.notice(.extensionLogger, "=== Notice visibility ===")
    Logger.notice(.extensionLogger, "=== 4 messages: notice, warning, error, critical ===")
    Logger.trace(.extensionLogger, error)
    Logger.debug(.extensionLogger, error)
    Logger.info(.extensionLogger, error)
    
    Logger.notice(.extensionLogger, error)
    Logger.warning(.extensionLogger, error)
    Logger.error(.extensionLogger, error)
    Logger.critical(.extensionLogger, error)
    
    Logger.notice(.extensionLogger, "=== TraceEx ===")
    Logger.notice(.extensionLogger, "=== 4 messages: notice, warning, error, critical ===")
    
    Logger.traceEx(.extensionLogger, error)
    Logger.debugEx(.extensionLogger, error)
    Logger.infoEx(.extensionLogger, error)
    Logger.noticeEx(.extensionLogger, error)
    Logger.warningEx(.extensionLogger, error)
    Logger.errorEx(.extensionLogger, error)
    Logger.criticalEx(.extensionLogger, error)
    
    Logger.notice(.extensionLogger, "=== TraceEx + Meta ===")
    Logger.notice(.extensionLogger, "=== 4 messages: notice, warning, error, critical ===")
    
    Logger.traceEx(.extensionLogger, error, metadata: ["some":"x"])
    Logger.debugEx(.extensionLogger, error, metadata: ["some":"x"])
    Logger.infoEx(.extensionLogger, error, metadata: ["some":"x"])
    Logger.noticeEx(.extensionLogger, error, metadata: ["some":"x"])
    Logger.warningEx(.extensionLogger, error, metadata: ["some":"x"])
    Logger.errorEx(.extensionLogger, error, metadata: ["some":"x"])
    Logger.criticalEx(.extensionLogger, error, metadata: ["some":"x"])
  }
  
  func testSendable() throws {
    final class SendableClass: Sendable {
      func log() {
        Logger.System.extensionLogger.level(.debug)
        Logger.debug(.extensionLogger, "Debug message")
      }
    }
  }
}
