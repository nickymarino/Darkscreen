//
//  BaseViewController.swift
//  Darkscreen
//
//  Created by Nicky Marino on 2/26/19.
//  Copyright © 2019 Nicky Marino. All rights reserved.
//

import UIKit


/// All ViewControllers should inherit from this base class
class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setNeedsStatusBarAppearanceUpdate()
        updateViewFromSettings()
        registerForSettingsChange()
    }

    /// Set the color of the status bar using the current theme
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return Settings.theme.statusBarStyle
    }

    func registerForSettingsChange() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(ViewController.settingsChanged),
                                               name: UserDefaults.didChangeNotification,
                                               object: nil)
    }

    @objc func settingsChanged() {
        updateViewFromSettings()
    }

    func updateViewFromSettings() {
        setNeedsStatusBarAppearanceUpdate()
        self.view.backgroundColor = Settings.theme.backgroundColor

        // Navbar background color
        UINavigationBar.appearance().barTintColor = Settings.theme.backgroundColor
        // Navbar text/icon color
        UINavigationBar.appearance().tintColor = Settings.theme.textColor

        self.navigationController?.navigationBar.barStyle = Settings.theme.navbarStyle
    }
}
