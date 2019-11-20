//
//  EditTripViewController.swift
//  Draft
//
//  Created by Zain Khoja on 11/19/19.
//

import UIKit

class EditTripViewController: UIViewController {
    
    var trip: Trip
    
    let BREEZE = UIColor(red: 239/255, green: 246/255, blue: 255/255, alpha: 1.0)
    var CREAM = UIColor(red: 255/255, green: 251/255, blue: 242/255, alpha: 1.0)
    var SPACE = UIColor(red: 27/255, green: 31/255, blue: 35/255, alpha: 1.0)
    var OCEAN = UIColor(red: 68/255, green: 77/255, blue: 86/255, alpha: 1.0)
    var RAIN = UIColor(red: 162/255, green: 162/255, blue: 162/255, alpha: 1.0)
    var CLOUD = UIColor(red: 250/255, green: 250/255, blue: 250/255, alpha: 1.0)
    
    init(trip: Trip, title: String) {
        self.trip = trip
        super.init(nibName: nil, bundle: nil)
        self.title = title
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = CREAM
        
        // Navigation Bar
        navigationController?.navigationBar.barTintColor = CLOUD
        
        // Appearance
        title = self.title
        let attrs = [
            NSAttributedString.Key.foregroundColor: SPACE,
            NSAttributedString.Key.font: UIFont(name: "NewYorkMedium-Bold", size: 17)!
        ]
        navigationController?.navigationBar.titleTextAttributes = attrs
        // Cancel button
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelPressed))
        cancelButton.tintColor = SPACE
        navigationItem.leftBarButtonItem = cancelButton
        // Add button
        let addButton = UIBarButtonItem(title: "Add", style: .done, target: self, action: #selector(addPressed))
        addButton.tintColor = SPACE
        navigationItem.rightBarButtonItem = addButton
        
        setupConstraints()
    }
    
    func setupConstraints() {
        
    }
    
    @objc func cancelPressed() {
        dismiss(animated: true)
    }
    
    @objc func addPressed() {
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
