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

        // Update the navigation bar
        if let navBar = self.navigationController?.navigationBar {
            // Background color
            navBar.barTintColor = Settings.theme.backgroundColor

            // Text & icon color
            navBar.tintColor = Settings.theme.primaryColor

            // Status bar style
            navBar.barStyle = Settings.theme.navbarStyle

            // Tell the system to update it
            navBar.setNeedsDisplay()
        }
    }
}
