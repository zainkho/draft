//
//  ViewController.swift
//  Draft
//
//  Created by Olivia on 11/16/19.
//

import UIKit
import SnapKit

enum State {
    case loading
    case past([Trip])
    case future([Trip])
}

class ViewController: UIViewController {
    
    var collectionView: UICollectionView!
    var addButton: UIButton!
    var headerGradientView: UIView!
    var headerGradient: CAGradientLayer!
    var footerGradientView: UIView!
    var footerGradient: CAGradientLayer!
    
    let tripCellReuseIdentifier = "tripCellReuseIdentifier"
    
    var pastTrips: [Trip]!
    var futureTrips: [Trip]!
    var trips: [Trip]!
    
//    var state: State = .past(pastTrips)
//    var trips = selectTrips(state)
    
    let SPACING_8: CGFloat = 8
    let SPACING_12: CGFloat = 12
    let SPACING_16: CGFloat = 16
    let SPACING_24: CGFloat = 24
    let CELL_HEIGHT: CGFloat = 156
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let BREEZE = UIColor(red: 239/255, green: 246/255, blue: 255/255, alpha: 1.0)
        let CLEAR = UIColor(red: 239/255, green: 246/255, blue: 255/255, alpha: 0.0)
        
        view.backgroundColor = BREEZE
        
        // headerGradient
        headerGradientView = UIView()
        headerGradient = CAGradientLayer()
        headerGradient.colors = [BREEZE.cgColor, CLEAR.cgColor]
        headerGradientView.layer.insertSublayer(headerGradient, at: 0)
        view.addSubview(headerGradientView)
        
        // footerGradient
        footerGradientView = UIView()
        footerGradient = CAGradientLayer()
        footerGradient.colors = [CLEAR.cgColor, BREEZE.cgColor]
        footerGradientView.layer.insertSublayer(footerGradient, at: 0)
        view.addSubview(footerGradientView)
        
        let day1 = Day(num: 1, emoji: "hi", attractions: ["statue of liberty","empire state building"], restaurants: ["ichiran", "chipotle"])
        let day2 = Day(num: 2, emoji: "hi2", attractions: ["uh","uhh"], restaurants: ["yum", "tasty"])
        let nyc = Trip(name:"nyc spring break", location: "nyc", length: 3, days: [day1, day2] )
        pastTrips = [nyc, nyc, nyc, nyc, nyc, nyc, nyc, nyc]
        trips = pastTrips
        
        let tripsLayout = UICollectionViewFlowLayout()
        tripsLayout.scrollDirection = .vertical
        tripsLayout.minimumLineSpacing = 48
        tripsLayout.minimumInteritemSpacing = 24
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: tripsLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .none
        collectionView.register(TripCollectionViewCell.self, forCellWithReuseIdentifier: tripCellReuseIdentifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        view.addSubview(collectionView)
        
        addButton = UIButton(frame: .zero)
        addButton.setTitle("Start a new adventure", for: .normal)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.setTitleColor(.black, for: .normal)
        view.addSubview(addButton)
        
        view.bringSubviewToFront(headerGradientView)
        view.bringSubviewToFront(footerGradientView)
        
        setupConstraints()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        headerGradient.frame = headerGradientView.bounds
        footerGradient.frame = footerGradientView.bounds
    }

    func setupConstraints() {
        headerGradientView.snp.makeConstraints { (make) in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(CELL_HEIGHT)
        }
        footerGradientView.snp.makeConstraints { (make) in
            make.bottom.leading.trailing.equalToSuperview()
            make.height.equalTo(CELL_HEIGHT)
        }
        collectionView.snp.makeConstraints { (make) in
            make.top.bottom.equalToSuperview()
            make.leading.equalTo(SPACING_8)
            make.trailing.equalTo(-SPACING_8)
        }
    }
    
    func selectTrips(state: State) -> [Trip]{
        switch state {
        case .past(let trips):
            return trips
        case .future(let trips):
            return trips
        case .loading:
            return []
        }
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return trips.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: tripCellReuseIdentifier, for: indexPath) as! TripCollectionViewCell
        cell.configure(for: trips[indexPath.row])
        return cell
    }
    
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
        let w = collectionView.frame.width
        return CGSize(width: w, height: CELL_HEIGHT)
    }
}

