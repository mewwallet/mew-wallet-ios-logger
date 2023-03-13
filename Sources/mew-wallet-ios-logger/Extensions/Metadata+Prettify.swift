//
//  File.swift
//  
//
//  Created by Mikhail Nikanorov on 3/12/23.
//

import Foundation

extension Logger.Metadata {
  var prettify: String? {
    guard !self.isEmpty else { return nil }
    return self.lazy.sorted(by: { $0.key < $1.key }).map { "\($0)=\($1)" }.joined(separator: " ")
  }
}
