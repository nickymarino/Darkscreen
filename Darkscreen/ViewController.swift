//
//  ViewController.swift
//  Darkscreen
//
//  Created by Nicky Marino on 2/15/19.
//  Copyright © 2019 Nicky Marino. All rights reserved.
//

import UIKit

class ViewController: BaseViewController {
    @IBOutlet weak var settingsButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        registerSettingsBundle()
    }

    func registerSettingsBundle() {
        Settings.setVersionAndBuildNumber()
        UserDefaults.standard.register(defaults: [String:AnyObject]())
        
    }

    override func updateTheme() {
        // ("gear.png" in Assets.xcassets is set to render as template image
        // to allow this to work)
        settingsButton?.tintColor = Settings.theme.secondaryColor

        super.updateTheme()
    }


    /// Hide the navigation bar when this view is shown
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: animated)

        // Must call super in overridden implementation
        super.viewWillAppear(animated)
    }

    /// Un-hide the navigation bar when this view isn't shown
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: animated)

        // Must call super in overridden implementation
        super.viewWillDisappear(animated)
    }
}

