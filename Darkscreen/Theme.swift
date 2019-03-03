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
    var primaryColor: UIColor
    var secondaryColor: UIColor

    var navbarStyle: UIBarStyle {
        get {
            if statusBarStyle == .default {
                return .default
            }
            return .black
        }
    }

    private static let themes: [String:Theme] = [
        "Dark": Theme(statusBar: .lightContent,
                      background: .black,
                      primary: .white,
                      secondary: .appleYellow),
        "Light": Theme(statusBar: .default,
                       background: .white,
                       primary: .black,
                       secondary: .appleBlue)
    ]

    init(statusBar: UIStatusBarStyle, background: UIColor, primary: UIColor, secondary: UIColor) {
        statusBarStyle = statusBar
        backgroundColor = background
        primaryColor = primary
        secondaryColor = secondary
    }

    static func getTheme(_ name: String) -> Theme {
        if let theme = themes[name] {
            return theme
        }
        return themes.first!.value
    }
}
