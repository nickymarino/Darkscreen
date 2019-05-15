//
//  BaseTableViewController.swift
//  
//
//  Created by Nicky Marino on 5/15/19.
//

import UIKit

class BaseTableViewController: UITableViewController {
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
        navigationController?.navigationBar.updateTheme()

        for cell in tableView.visibleCells {
            cell.updateTheme()
        }
    }
}
