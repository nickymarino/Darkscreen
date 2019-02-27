//
//  ViewController.swift
//  Darkscreen
//
//  Created by Nicky Marino on 2/15/19.
//  Copyright © 2019 Nicky Marino. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private var settings = SettingsModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view, typically from a nib.
        setNeedsStatusBarAppearanceUpdate()
        registerSettingsBundleAndChangeObserver()
        updateViewFromSettings()
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return settings.theme.statusBarStyle
    }

    func registerSettingsBundleAndChangeObserver() {
        UserDefaults.standard.register(defaults: [String:AnyObject]())
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(ViewController.defaultsChanged),
                                               name: UserDefaults.didChangeNotification,
                                               object: nil)
    }

    @objc func defaultsChanged() {
        updateViewFromSettings()
    }

    func updateViewFromSettings() {
        setNeedsStatusBarAppearanceUpdate()
        self.view.backgroundColor = settings.theme.backgroundColor
    }
}

