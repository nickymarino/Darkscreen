//
//  SettingsModel.swift
//  Darkscreen
//
//  Created by Nicky Marino on 2/26/19.
//  Copyright © 2019 Nicky Marino. All rights reserved.
//

import Foundation
import UIKit

// Tutorial used:
// https://medium.com/@abhimuralidharan/adding-settings-to-your-ios-app-cecef8c5497

class SettingsModel {
    class ThemeModel {
        var statusBarStyle: UIStatusBarStyle
        var backgroundColor: UIColor

        init(statusBar: UIStatusBarStyle, background: UIColor) {
            statusBarStyle = statusBar
            backgroundColor = background
        }
    }

    let themes: [String:ThemeModel] = [
        "Dark": ThemeModel(statusBar: .lightContent, background: .black),
        "Light": ThemeModel(statusBar: .default, background: .white)
    ]

    var theme: ThemeModel {
        get {
            if SettingsBundleHelper.darkModeEnabled() {
                return themes["Dark"]!
            }
            return themes["Light"]!
        }
    }

    init() {
        SettingsBundleHelper.setVersionAndBuildNumber()
    }
}
