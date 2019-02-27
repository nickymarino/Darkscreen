//
//  Theme.swift
//  Darkscreen
//
//  Created by Nicky Marino on 2/26/19.
//  Copyright © 2019 Nicky Marino. All rights reserved.
//

import Foundation
import UIKit

class Theme {
    var statusBarStyle: UIStatusBarStyle
    var backgroundColor: UIColor
    var textColor: UIColor

    var navbarStyle: UIBarStyle {
        get {
            if statusBarStyle == .default {
                return .default
            }
            return .black
        }
    }

    init(statusBar: UIStatusBarStyle, background: UIColor, text: UIColor) {
        statusBarStyle = statusBar
        backgroundColor = background
        textColor = text
    }
}


/// Collection of Apple colours found in Human Interface Guidelines
/// https://developer.apple.com/ios/human-interface-guidelines/visual-design/color/
public extension UIColor {
    static let appleRed = UIColor(red: 255/255, green: 59/255, blue: 48/255, alpha: 1)
    static let appleOrange = UIColor(red: 255/255, green: 149/255, blue: 0/255, alpha: 1)
    static let appleYellow = UIColor(red: 255/255, green: 204/255, blue: 0/255, alpha: 1)
    static let appleGreen = UIColor(red: 76/255, green: 217/255, blue: 100/255, alpha: 1)
    static let appleTealBlue = UIColor(red: 90/255, green: 200/255, blue: 250/255, alpha: 1)
    static let appleBlue = UIColor(red: 0/255, green: 122/255, blue: 255/255, alpha: 1)
    static let applePurple = UIColor(red: 88/255, green: 86/255, blue: 214/255, alpha: 1)
    static let applePink = UIColor(red: 255/255, green: 45/255, blue: 85/255, alpha: 1)
}
