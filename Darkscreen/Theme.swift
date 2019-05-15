//
//  Theme.swift
//  Darkscreen
//
//  Created by Nicky Marino on 2/26/19.
//  Copyright © 2019 Nicky Marino. All rights reserved.
//

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
    var isSelected: Bool {
        get {
            return Settings.shared.theme.name == name
        } set {
            Settings.shared.theme.name = name
        }
    }

    init(_ name: String, statusBar: UIStatusBarStyle, background: UIColor, primary: UIColor, secondary: UIColor) {
        self.name = name
        statusBarStyle = statusBar
        backgroundColor = background
        primaryColor = primary
        secondaryColor = secondary
    }
}

extension Array where Element:Theme {
    func getFirstBy(name: String?) -> Theme? {
        return self.first(where: {$0.name == name})
    }

    func getFirstIndexBy(name: String?) -> Index? {
        return self.firstIndex(where: {$0.name == name})
    }
}
