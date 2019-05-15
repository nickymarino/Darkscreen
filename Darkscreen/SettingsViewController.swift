//
//  SettingsViewController.swift
//  Darkscreen
//
//  Created by Nicky Marino on 2/26/19.
//  Copyright © 2019 Nicky Marino. All rights reserved.
//

import UIKit

class SettingsViewController: BaseViewController {
    @IBOutlet weak var darkModeEnabledSwitch: UISwitch!
    @IBOutlet weak var darkModeEnabledLabel: UILabel!
    @IBOutlet weak var themeTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        updateTheme()
    }

    override func updateTheme() {
        darkModeEnabledSwitch.isOn = Settings.darkModeEnabled
        darkModeEnabledLabel.updateTheme()
        super.updateTheme()
    }

    @IBAction func darkModeEnabledSwitchUpdated(_ sender: Any) {
        Settings.darkModeEnabled = darkModeEnabledSwitch.isOn
    }
}
