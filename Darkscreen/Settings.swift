//
//  l.swift
//  Darkscreen
//
//  Created by Nicky Marino on 2/26/19.
//  Copyright © 2019 Nicky Marino. All rights reserved.
//

import Foundation
import UIKit

// Tutorial used:
// https://medium.com/@abhimuralidharan/adding-settings-to-your-ios-app-cecef8c5497

class Settings {
    class var theme: Theme {
        get {
            if darkModeEnabled {
                return Theme.getThemeBy(name: "Dark")
            }
            return Theme.getThemeBy(name: "Light")
        }
    }

    class var darkModeEnabled: Bool {
        get { return SettingsBundleHelper.darkModeEnabled }
        set(isEnabled) { SettingsBundleHelper.darkModeEnabled = isEnabled }
    }

    class func availableThemes() -> [String] {
        return Theme.themeNames()
    }

    class func setVersionAndBuildNumber() {
        SettingsBundleHelper.setVersionAndBuildNumber()
    }
}


/// Used to communciate directly with stored info in the Settings.bundle
private class SettingsBundleHelper {
    struct BundleKeys {
        static let DarkModeEnabledKey = "dark_mode_enabled_preference"
        static let BuildVersionKey = "build_preference"
        static let AppVersionKey = "version_preference"
    }

    class func setVersionAndBuildNumber() {
        let version = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String
        UserDefaults.standard.set(version, forKey: BundleKeys.AppVersionKey)

        let build = Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as! String
        UserDefaults.standard.set(build, forKey: BundleKeys.BuildVersionKey)
    }

    class var darkModeEnabled: Bool {
        get {
            return UserDefaults.standard.bool(forKey: BundleKeys.DarkModeEnabledKey)
        }
        set(isEnabled) {
            UserDefaults.standard.set(isEnabled, forKey: BundleKeys.DarkModeEnabledKey)
        }
    }
}
