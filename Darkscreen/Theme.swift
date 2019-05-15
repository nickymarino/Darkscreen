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
    var name: String
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

    static let themes: [Theme] = [
        Theme("Dark", statusBar: .lightContent,
                      background: .black,
                      primary: .white,
                      secondary: .appleYellow),
        Theme("Light", statusBar: .default,
                       background: .white,
                       primary: .black,
                       secondary: .appleBlue)
    ]

    init(_ name: String, statusBar: UIStatusBarStyle, background: UIColor, primary: UIColor, secondary: UIColor) {
        self.name = name
        statusBarStyle = statusBar
        backgroundColor = background
        primaryColor = primary
        secondaryColor = secondary
    }

    static func getThemeBy(name: String) -> Theme {
        for theme in themes {
            if theme.name == name {
                return theme
            }
        }
        return themes.first!
    }

    static func getThemeBy(rowNumber: Int) -> Theme {
        if rowNumber > themes.count {
            print("Error: row number \(rowNumber) > theme count \(themes.count)")
            return themes[0]
        }
        return themes[rowNumber]
    }

    static func themeNames() -> [String] {
        return themes.map({$0.name}).sorted()
    }
}
