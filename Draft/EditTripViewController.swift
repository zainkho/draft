//
//  EditTripViewController.swift
//  Draft
//
//  Created by Zain Khoja on 11/19/19.
//

import UIKit
import SnapKit

class EditTripViewController: UIViewController {
    
    var trip: Trip
    var tableView: UITableView!
    var cells: [InputCell]!
    
    var tripName: String
    var location: String
    var days: [Day]
    
    let reuseIdentifier = "inputCellReuseIdentifiers"
    let cellHeight: CGFloat = 48
    
    init(trip: Trip, title: String) {
        self.trip = trip
        self.tripName = trip.name
        self.location = trip.location
        self.days = [Day(num: 1, attractions: [], restaurants: [])]
        super.init(nibName: nil, bundle: nil)
        self.title = title
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .CREAM
        
        // Navigation Bar
        navigationController?.navigationBar.barTintColor = .CLOUD
        
        // Appearance
        title = self.title
        let attrs = [
            NSAttributedString.Key.foregroundColor: UIColor.SPACE,
            NSAttributedString.Key.font: UIFont.LABEL!
        ]
        navigationController?.navigationBar.titleTextAttributes = attrs
        // Cancel button
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelPressed))
        cancelButton.tintColor = .SPACE
        navigationItem.leftBarButtonItem = cancelButton
        // Add button
        let addButton = UIBarButtonItem(title: "Add", style: .done, target: self, action: #selector(addPressed))
        addButton.tintColor = .SPACE
        navigationItem.rightBarButtonItem = addButton
        
        
        let inputCell1 = InputCell(text: "hi")
        let inputCell2 = InputCell(text: "hi2")
        cells = [inputCell1, inputCell2]
        
        tableView = UITableView()
        tableView.backgroundColor = .CREAM
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(InputTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        view.addSubview(tableView)

        setupConstraints() 
    }
    
    func setupConstraints() {
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.topMargin).offset(SPACING_24)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    @objc func cancelPressed() {
        dismiss(animated: true)
    }
    
    @objc func addPressed() {
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func dismissViewController() {
        dismiss(animated: true, completion: nil)
    }

}

extension EditTripViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }
}

extension EditTripViewController : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2 + days.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! InputTableViewCell
        let inputCell = cells[indexPath.row]
        cell.configure(for: inputCell)
        cell.selectionStyle = .none
        return cell
    }
}
