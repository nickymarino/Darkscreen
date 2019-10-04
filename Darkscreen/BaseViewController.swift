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
        updateTheme()
        registerForSettingsChange()
    }

    /// Set the color of the status bar using the current theme
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return Settings.shared.theme.statusBarStyle
    }

    func registerForSettingsChange() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(BaseViewController.settingsChanged),
                                               name: UserDefaults.didChangeNotification,
                                               object: nil)
    }

    @objc func settingsChanged() {
        updateTheme()
    }

    func updateTheme() {
        // Status bar
        setNeedsStatusBarAppearanceUpdate()

        // Background color
        self.view.backgroundColor = Settings.shared.theme.backgroundColor

        // Navigation bar
        self.navigationController?.navigationBar.updateTheme()
    }
}
