//
//  File.swift
//  
//
//  Created by Mikhail Nikanorov on 3/12/23.
//

import Foundation
#if canImport(os)
  import os
  public typealias Logger = os.Logger
#else
  import Logging
  public typealias Logger = Logging.Logger
#endif
