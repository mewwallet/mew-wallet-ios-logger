//
//  BaseTests.swift
//  
//
//  Created by Mikhail Nikanorov on 3/12/23.
//

import XCTest
import mew_wallet_ios_logger

import Logging

final class BaseTests: XCTestCase {
  func testBasicUsage() throws {
    var logger = Logger.System.with(subsystem: "basic system", category: "basic category")
    
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
}
