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
    
    let reuseIdentifier = "inputCellReuseIdentifiers"
    let cellHeight: CGFloat = 48
    
    init(trip: Trip) {
        self.trip = trip
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        title = "New Trip"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(dismissViewController))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .done, target: self, action: nil) //action nil rn bc unimplemented
        
        
        let inputCell1 = InputCell(text: "hi")
        let inputCell2 = InputCell(text: "hi2")
        cells = [inputCell1, inputCell2]
        
        tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(InputTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        view.addSubview(tableView)
        
        setupConstraints()
        
    }
    
    func setupConstraints() {
        tableView.snp.makeConstraints { (make) in
            make.top.leading.trailing.bottom.equalToSuperview()
        }
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
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! InputTableViewCell
        let inputCell = cells[indexPath.row]
        cell.configure(for: inputCell)
        cell.selectionStyle = .none
        return cell
    }
}
