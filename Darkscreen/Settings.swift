//
//  Settings.swift
//  Darkscreen
//
//  Created by Nicky Marino on 2/26/19.
//  Copyright © 2019 Nicky Marino. All rights reserved.
//

import UIKit

// Tutorial used:
// https://medium.com/@abhimuralidharan/adding-settings-to-your-ios-app-cecef8c5497

class Settings {

    static let shared = Settings()

    var theme: Theme {
        get {
            return Settings.themes.getFirstBy(name: themeName) ?? Settings.themes.getFirstBy(name: "Dark")!
        } set {
            themeName = newValue.name
        }
    }

    var versionNumber: String? {
        get { return UserDefaults.standard.string(forKey: BundleKeys.Version) }
        set { UserDefaults.standard.set(newValue, forKey: BundleKeys.Version) }
    }

    var buildNumber: String? {
        get { return UserDefaults.standard.string(forKey: BundleKeys.Build) }
        set { UserDefaults.standard.set(newValue, forKey: BundleKeys.Build) }
    }

    // MARK: - Class properties/methods

    class func setVersionAndBuildNumber() {
        let version = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String
        UserDefaults.standard.set(version, forKey: BundleKeys.Version)
        
        let build = Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as! String
        UserDefaults.standard.set(build, forKey: BundleKeys.Build)
    }

    static let themes: [Theme] = [
        Theme("Dark",
              statusBar: .lightContent,
              background: .black,
              primary: .white,
              secondary: .appleYellow),
        Theme("Light",
              statusBar: .default,
              background: .white,
              primary: .black,
              secondary: .appleBlue),
        Theme("IU Sucks",
              statusBar: .default,
              background: .white,
              primary: .black,
              secondary: .appleRed),
        Theme("90s",
              statusBar: .default,
              background: UIColor(red: 2/255, green: 53/255, blue: 97/255, alpha: 1),
              primary: UIColor(red: 214/255, green: 176/255, blue: 39/255, alpha: 1),
              secondary: UIColor(red: 247/255, green: 83/255, blue: 134/255, alpha: 1))
    ]

    // MARK: - Private implementation

    private init() {}

    /// The theme name is used as the unique key in settings
    private var themeName: String {
        get { return UserDefaults.standard.string(forKey: BundleKeys.Theme) ?? "Dark" }
        set { UserDefaults.standard.set(newValue, forKey: BundleKeys.Theme) }
    }

    /// String versions of the items in Settings.bundle
    private struct BundleKeys {
        static let Theme = "theme_preference"
        static let Build = "build_preference"
        static let Version = "version_preference"
    }
}

