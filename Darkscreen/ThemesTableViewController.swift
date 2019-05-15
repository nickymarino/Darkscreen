//
//  ThemesViewController.swift
//  Darkscreen
//
//  Created by Nicky Marino on 5/15/19.
//  Copyright © 2019 Nicky Marino. All rights reserved.
//

import UIKit

class ThemesTableViewController: BaseTableViewController {

    @IBOutlet weak var doneButton: UIBarButtonItem!

    override func viewDidLoad() {
        super.viewDidLoad()

        doneButton.target = self
        doneButton.action = #selector(ThemesTableViewController.doneButtonPressed)
    }

    @objc func doneButtonPressed() {
        self.dismiss(animated: true)
    }

    // MARK: - Table view

    var selectedIndex: IndexPath = IndexPath(row: 0, section: 0)

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Settings.themes.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ThemeCell", for: indexPath)

        // Configure the cell
        let theme = Settings.themes[indexPath.row]
        if theme.isSelected {
            selectedIndex = indexPath
        }
        cell.textLabel?.text = theme.name
        cell.selectionStyle = .none
        cell.accessoryType = theme.isSelected ? .checkmark : .none
        cell.updateTheme()

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let oldSelectedCell = tableView.cellForRow(at: selectedIndex) {
            oldSelectedCell.accessoryType = .none
        }

        if let newSelectedCell = tableView.cellForRow(at: indexPath), let newTheme = Settings.themes.getFirstBy(name: newSelectedCell.textLabel?.text) {
            Settings.shared.theme = newTheme

            newSelectedCell.accessoryType = .checkmark

            selectedIndex = indexPath
        }
    }
}
