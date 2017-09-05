//
//  SVNMaterialButtonDataSource.swift
//  SVNMaterialButton
//
//  Created by Aaron Dean Bikis on 9/5/17.
//  Copyright © 2017 7apps. All rights reserved.
//

import Foundation

public protocol SVNMaterialButtonViewModel {
  var textColor: UIColor { get }
  var isRounded: Bool { get }
  var enabledColor: UIColor { get }
  var disabledColor: UIColor { get }
  var text: String { get }
  var font: UIFont { get }
}
