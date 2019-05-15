//
//  ViewController.swift
//  Darkscreen
//
//  Created by Nicky Marino on 2/15/19.
//  Copyright © 2019 Nicky Marino. All rights reserved.
//

import UIKit

class DSViewController: BaseViewController {
    @IBOutlet weak var settingsButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        registerSettingsBundle()
    }

    func registerSettingsBundle() {
        Settings.setVersionAndBuildNumber()
        UserDefaults.standard.register(defaults: [String:AnyObject]())
    }
}

