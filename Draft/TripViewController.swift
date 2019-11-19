//
//  TripViewController.swift
//  Draft
//
//  Created by Zain Khoja on 11/19/19.
//

import UIKit

class TripViewController: UIViewController {

    var trip: Trip!
    
    init(trip: Trip) {
        self.trip = trip
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
