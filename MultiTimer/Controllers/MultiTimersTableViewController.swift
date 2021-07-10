//
//  TableViewController.swift
//  MultiTimer
//
//  Created by Timur on 02.07.2021.
//

import UIKit

class MultiTimersTableViewController: UITableViewController {
    
    var multiTimersViewModel: MultiTimersTableViewProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configuration()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return multiTimersViewModel.numberOfSection()
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return multiTimersViewModel.getSectionName(for: section)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return multiTimersViewModel.numberOfRowsInSection(for: section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: AddTimerTableViewCell.identifier, for: indexPath) as? AddTimerTableViewCell
            guard let tableCell = cell else { return UITableViewCell() }
            tableCell.delegate = multiTimersViewModel
            return tableCell
        }
        if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: TimerTableViewCell.identifier, for: indexPath) as? TimerTableViewCell
            guard let tableCell = cell else { return UITableViewCell() }
            tableCell.update(for: multiTimersViewModel.timers.value[indexPath.row])
            tableCell.delegate = multiTimersViewModel
            return tableCell
        }
        return UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // MARK: - Configure
    fileprivate func configuration() {
        self.navigationItem.title = "Мульти таймер"
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.tableFooterView = UIView()
        self.tableView.register(AddTimerTableViewCell.self, forCellReuseIdentifier: AddTimerTableViewCell.identifier)
        self.tableView.register(TimerTableViewCell.self, forCellReuseIdentifier: TimerTableViewCell.identifier)
        
        multiTimersViewModel.timers.bind { _ in
            DispatchQueue.main.async {
                self.tableView.beginUpdates()
                self.tableView.reloadSections(NSIndexSet(index: 1) as IndexSet, with: UITableView.RowAnimation.none)
                self.tableView.endUpdates()
            }
        }
    }
}
