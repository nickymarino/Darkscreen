//
//  ViewController.swift
//  Darkscreen
//
//  Created by Nicky Marino on 2/15/19.
//  Copyright © 2019 Nicky Marino. All rights reserved.
//

import UIKit

class ViewController: BaseViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        registerSettingsBundle()
    }

    func registerSettingsBundle() {
        Settings.setVersionAndBuildNumber()
        UserDefaults.standard.register(defaults: [String:AnyObject]())
        
    }

    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: animated)

        // Must call super in overridden implementation
        super.viewWillAppear(animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: animated)

        // Must call super in overridden implementation
        super.viewWillDisappear(animated)
    }
}

