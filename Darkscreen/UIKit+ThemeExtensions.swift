//
//  UIKit+ThemeExtensions.swift
//  Darkscreen
//
//  Created by Nicky Marino on 3/1/19.
//  Copyright © 2019 Nicky Marino. All rights reserved.
//

import UIKit

public extension UINavigationBar {
    func updateTheme() {
        // Background color
        barTintColor = Settings.shared.theme.backgroundColor

        // Text & icon color
        tintColor = Settings.shared.theme.secondaryColor

        // Status bar style
        barStyle = Settings.shared.theme.navbarStyle

        // Tell the system to update it
        setNeedsDisplay()
    }
}

public extension UILabel {
    func updateTheme() {
        textColor = Settings.shared.theme.primaryColor
    }
}

public extension UITableViewCell {
    func updateTheme() {
        textLabel?.updateTheme()
        backgroundColor = Settings.shared.theme.backgroundColor
        tintColor = Settings.shared.theme.secondaryColor
    }
}

public extension UIColor {
    // Collection of Apple colours found in Human Interface Guidelines
    // https://developer.apple.com/ios/human-interface-guidelines/visual-design/color/
    static let appleRed = UIColor(red: 255/255, green: 59/255, blue: 48/255, alpha: 1)
    static let appleOrange = UIColor(red: 255/255, green: 149/255, blue: 0/255, alpha: 1)
    static let appleYellow = UIColor(red: 255/255, green: 204/255, blue: 0/255, alpha: 1)
    static let appleGreen = UIColor(red: 76/255, green: 217/255, blue: 100/255, alpha: 1)
    static let appleTealBlue = UIColor(red: 90/255, green: 200/255, blue: 250/255, alpha: 1)
    static let appleBlue = UIColor(red: 0/255, green: 122/255, blue: 255/255, alpha: 1)
    static let applePurple = UIColor(red: 88/255, green: 86/255, blue: 214/255, alpha: 1)
    static let applePink = UIColor(red: 255/255, green: 45/255, blue: 85/255, alpha: 1)
}
