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
//    var cells: [InputCell]!
    var cells: [[InputCell]]!
    
    var tripName: String
    var location: String
    var days: [Day]
    
    let inputReuseIdentifier = "inputCellReuseIdentifiers"
    let buttonReuseIdentifier = "buttonCellReuseIdentifiers"
    let CELL_HEIGHT: CGFloat = 48
    let HEADER_LABEL_HEIGHT: CGFloat = 68
    
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
        
        
        
        var inputCells = [[InputCell]]()
        let days = trip.days
        for day in days {
            var dayArray = [InputCell]()
            for a in day.attractions {
                print(a)
                dayArray.append(InputCell(text: a, type: .input))
            }
            dayArray.append(InputCell(text: "+ Add Attraction", type: .button))
            for r in day.restaurants {
                print(r)
                dayArray.append(InputCell(text: r, type: .input))
            }
            dayArray.append(InputCell(text: "+ Add Restaurant", type: .button))
            inputCells.append(dayArray)
        }
        cells = inputCells
        print(cells)
        
//        let days = trip.days
//        var inputCells = [InputCell]()
//        for day in days {
//            for a in day.attractions {
//                print(a)
//                inputCells.append(InputCell(text: a, type: .input))
//            }
//            inputCells.append(InputCell(text: "+ Add Attraction", type: .button))
//            for r in day.restaurants {
//                print(r)
//                inputCells.append(InputCell(text: r, type: .input))
//            }
//            inputCells.append(InputCell(text: "+ Add Restaurant", type: .button))
//        }
        
//        let inputCell1 = InputCell(text: "hi", type: .input)
//        let inputCell2 = InputCell(text: "hi2", type: .input)
//        cells = [inputCell1, inputCell2, inputCell1, inputCell2, inputCell1, inputCell2]
//        cells = inputCells
//        print(cells)
        
        // Set up tableView
        tableView = UITableView()
        tableView.backgroundColor = .CREAM
        tableView.separatorColor = .RAIN
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(InputTableViewCell.self, forCellReuseIdentifier: inputReuseIdentifier)
        tableView.register(ButtonTableViewCell.self, forCellReuseIdentifier: buttonReuseIdentifier)
        view.addSubview(tableView)

        setupConstraints() 
    }
    
    func setupConstraints() {
        tableView.snp.makeConstraints { (make) in
            make.top.leading.trailing.bottom.equalToSuperview()
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
        return CELL_HEIGHT
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            return UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: CELL_HEIGHT))
        }
        else {
            return HeaderLabelView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: HEADER_LABEL_HEIGHT))
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return CELL_HEIGHT
        }
        else {
            return HEADER_LABEL_HEIGHT
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

extension EditTripViewController : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1 + days.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 2
        }
        else {
            return 2 + trip.days[section - 1].attractions.count + trip.days[section - 1].restaurants.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let inputCell = cells[indexPath.section][indexPath.row]
        if inputCell.type == .input {
            let cell = tableView.dequeueReusableCell(withIdentifier: inputReuseIdentifier, for: indexPath) as! InputTableViewCell
            cell.selectionStyle = .none
            //        let inputCell = cells[indexPath.row]
            
            if indexPath.row == tableView.numberOfRows(inSection: indexPath.section) - 1 {
                //            let inputCell = cells[indexPath.section][indexPath.row]
                cell.configure(for: inputCell, section: indexPath.section, index: -1, trip: trip)
            }
            else {
                //            let inputCell = cells[indexPath.section][indexPath.row]
                cell.configure(for: inputCell, section: indexPath.section, index: indexPath.row, trip: trip)
            }
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: buttonReuseIdentifier, for: indexPath) as! ButtonTableViewCell
            cell.selectionStyle = .none
            //        let inputCell = cells[indexPath.row]
            
            if indexPath.row == tableView.numberOfRows(inSection: indexPath.section) - 1 {
                //            let inputCell = cells[indexPath.section][indexPath.row]
                cell.configure(for: inputCell, section: indexPath.section, index: -1, trip: trip)
            }
            else {
                //            let inputCell = cells[indexPath.section][indexPath.row]
                cell.configure(for: inputCell, section: indexPath.section, index: indexPath.row, trip: trip)
            }
            return cell

        }
//        cell.selectionStyle = .none
////        let inputCell = cells[indexPath.row]
//
//        if indexPath.row == tableView.numberOfRows(inSection: indexPath.section) - 1 {
////            let inputCell = cells[indexPath.section][indexPath.row]
//            cell.configure(for: inputCell, section: indexPath.section, index: -1, trip: trip)
//        }
//        else {
////            let inputCell = cells[indexPath.section][indexPath.row]
//            cell.configure(for: inputCell, section: indexPath.section, index: indexPath.row, trip: trip)
//        }
//        return cell
    }
}
