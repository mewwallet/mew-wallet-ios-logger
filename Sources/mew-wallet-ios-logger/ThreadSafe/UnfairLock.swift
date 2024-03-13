//
//  File.swift
//
//
//  Created by Mikhail Nikanorov on 2/26/24.
//

import Foundation
import os

internal final class UnfairLock {
  // MARK: Lifecycle
  
  internal init() {
    self.pointer = .allocate(capacity: 1)
    self.pointer.initialize(to: os_unfair_lock())
  }
  
  deinit {
    self.pointer.deinitialize(count: 1)
    self.pointer.deallocate()
  }
  
  // MARK: Internal
  
  internal func lock() {
    os_unfair_lock_lock(self.pointer)
  }
  
  internal func unlock() {
    os_unfair_lock_unlock(self.pointer)
  }
  
  internal func tryLock() -> Bool {
    os_unfair_lock_trylock(self.pointer)
  }
  
  @discardableResult
  @inlinable
  internal func execute<T>(_ action: () -> T) -> T {
    self.lock(); defer { self.unlock() }
    return action()
  }
  
  @discardableResult
  @inlinable
  internal func tryExecute<T>(_ action: () throws -> T) throws -> T {
    try self.execute { Result(catching: action) }.get()
  }
  
  // MARK: Private
  
  private let pointer: os_unfair_lock_t
}
