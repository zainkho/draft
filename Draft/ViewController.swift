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
    
    let tripCellReuseIdentifier = "tripCellReuseIdentifier"
    let padding: CGFloat = 8
    
    var pastTrips: [Trip]!
    var futureTrips: [Trip]!
    var trips: [Trip]!
    
//    var state: State = .past(pastTrips)
//    var trips = selectTrips(state)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let day1 = Day(num: 1, emoji: "hi", attractions: ["statue of liberty","empire state building"], restaurants: ["ichiran", "chipotle"])
        let day2 = Day(num: 2, emoji: "hi2", attractions: ["uh","uhh"], restaurants: ["yum", "tasty"])
        let nyc = Trip(name:"nyc spring break", location: "nyc", length: 3, days: [day1, day2] )
        pastTrips = [nyc, nyc, nyc]
        trips = pastTrips
        
        let tripsLayout = UICollectionViewFlowLayout()
        tripsLayout.scrollDirection = .vertical
        tripsLayout.minimumLineSpacing = padding
        tripsLayout.minimumInteritemSpacing = padding
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: tripsLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .gray
        collectionView.register(TripCollectionViewCell.self, forCellWithReuseIdentifier: tripCellReuseIdentifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        view.addSubview(collectionView)
        
        addButton = UIButton(frame: .zero)
        addButton.setTitle("Start a new adventure", for: .normal)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.setTitleColor(.black, for: .normal)
        view.addSubview(addButton)
        
        setupConstraints()
        
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
        
        NSLayoutConstraint.activate([
            addButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            addButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            addButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding)
            ])
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
        // We want: | padding CELL padding CELL padding CELL padding |
        let size = (collectionView.frame.width - 2 * padding)
        return CGSize(width: size, height: size)
    }
}

