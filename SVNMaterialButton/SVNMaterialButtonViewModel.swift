//
//  SVNMaterialButtonDataSource.swift
//  SVNMaterialButton
//
//  Created by Aaron Dean Bikis on 9/5/17.
//  Copyright © 2017 7apps. All rights reserved.
//

import Foundation
import SVNTheme

public protocol SVNMaterialButtonViewModel {
  var textColor: UIColor { get }
  var isRounded: Bool { get }
  var enabledColor: UIColor { get }
  var disabledColor: UIColor { get }
  var text: String { get }
  var font: UIFont { get }
}

public struct SVNMaterialButtonStandardViewModel: SVNMaterialButtonViewModel {
  public var textColor: UIColor = UIColor.white
  public var isRounded: Bool = false
  public var enabledColor: UIColor = SVNTheme_DefaultDark().primaryDialogColor
  public var disabledColor: UIColor = SVNTheme_DefaultDark().primaryDialogColor.withAlphaComponent(0.75)
  public var text: String = "Continue"
  public var font: UIFont = SVNTheme_DefaultDark().mediumHeading
}
