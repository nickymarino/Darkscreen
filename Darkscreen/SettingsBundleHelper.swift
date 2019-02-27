//
//  SettingsBundleHelper.swift
//  Darkscreen
//
//  Created by Nicky Marino on 2/26/19.
//  Copyright © 2019 Nicky Marino. All rights reserved.
//


import Foundation

class SettingsBundleHelper {
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

    class func darkModeEnabled() -> Bool {
        return UserDefaults.standard.bool(forKey: BundleKeys.DarkModeEnabledKey)
    }
}
