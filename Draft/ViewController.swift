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

protocol EditTripDelegate: class {
    
}

protocol PushTripCardDelegate: class {
    func pushTripViewController()
}

protocol PresentEditCardDelegate: class {
    func presentEditViewController()
}

class ViewController: UIViewController {
    
    var collectionView: UICollectionView!
    var headerGradientView: UIView!
    var headerGradient: CAGradientLayer!
    var footerGradientView: UIView!
    var footerGradient: CAGradientLayer!
    var emptyState: UIView!
    
    let tripCellReuseIdentifier = "tripCellReuseIdentifier"
    let headerViewReuseIdentifier = "filterViewReuseIdentifier"
    
    var pastTrips: [Trip]!
    var futureTrips: [Trip]!
    var trips: [Trip]!
    
    let SPACING_8: CGFloat = 8
    let SPACING_12: CGFloat = 12
    let SPACING_16: CGFloat = 16
    let SPACING_24: CGFloat = 24
    let SPACING_132: CGFloat = 132
    let HEADER_HEIGHT: CGFloat = 168
    let CELL_HEIGHT: CGFloat = 168
    let GRADIENT_HEIGHT: CGFloat = 96
    
    let BREEZE = UIColor(red: 239/255, green: 246/255, blue: 255/255, alpha: 1.0)
    let CLEAR = UIColor(red: 239/255, green: 246/255, blue: 255/255, alpha: 0.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: false)
        
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
        let nyc = Trip(name:"NYC Spring Break", location: "nyc", length: 3, days: [day1, day2] )
        pastTrips = [nyc, nyc, nyc, nyc, nyc, nyc, nyc, nyc]
        trips = pastTrips
        
        // Set up tripsLayout
        let tripsLayout = UICollectionViewFlowLayout()
        tripsLayout.scrollDirection = .vertical
        tripsLayout.minimumLineSpacing = SPACING_24
        tripsLayout.minimumInteritemSpacing = SPACING_24
        tripsLayout.sectionInset.left = SPACING_16
        tripsLayout.sectionInset.right = SPACING_16
        
        // Set up collectionView
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: tripsLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .none
        
        // Register cell
        collectionView.register(TripCollectionViewCell.self, forCellWithReuseIdentifier: tripCellReuseIdentifier)
        collectionView.register(HeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerViewReuseIdentifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        view.addSubview(collectionView)
        
        // Bring cloudy gradients to front
        view.bringSubviewToFront(headerGradientView)
        view.bringSubviewToFront(footerGradientView)
        
        // emptyState
        emptyState = UIView()
        view.addSubview(emptyState)
        
        setupConstraints()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        headerGradient.frame = headerGradientView.bounds
        footerGradient.frame = footerGradientView.bounds
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if collectionView.contentOffset.y <= 1 {
            headerGradient.opacity = 0
        }
        else {
            headerGradient.opacity = 1
        }
    }

    func setupConstraints() {
        headerGradientView.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.topMargin)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(GRADIENT_HEIGHT)
        }
        
        footerGradientView.snp.makeConstraints { (make) in
            make.bottom.leading.trailing.equalToSuperview()
            make.height.equalTo(GRADIENT_HEIGHT)
        }
        
        collectionView.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.topMargin)
            make.bottom.leading.trailing.equalToSuperview()
        }
        
        emptyState.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(SPACING_132)
            make.leading.bottom.trailing.equalToSuperview()
        }
    }
}
    
extension ViewController: UICollectionViewDataSource {
    
    // collectionView
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return trips.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: tripCellReuseIdentifier, for: indexPath) as! TripCollectionViewCell
        cell.configure(for: trips[indexPath.row])
        cell.presentDelegate = self
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerViewReuseIdentifier, for: indexPath) as! HeaderView
        
        return headerView
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    // collectionView
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let w = collectionView.frame.width - SPACING_16*2
        
        return CGSize(width: w, height: CELL_HEIGHT)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let trip = trips[indexPath.row]
        let viewController = TripViewController(trip: trip)
        navigationController?.pushViewController(viewController, animated: true)
        
    }
    
    // HeaderView
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        let w = collectionView.frame.width - SPACING_16*2
        return CGSize(width: w, height: HEADER_HEIGHT)
    }
}

extension ViewController : PushTripCardDelegate {
    func pushTripViewController() {
        print("hi")
//        let viewController = TripViewController()
//        present(viewController, animated: true, completion: nil)
    }
}

extension ViewController : PresentEditCardDelegate {
    func presentEditViewController() {
        print("view call")
        let day1 = Day(num: 1, emoji: "hi", attractions: ["statue of liberty","empire state building"], restaurants: ["ichiran", "chipotle"])
        let day2 = Day(num: 2, emoji: "hi2", attractions: ["uh","uhh"], restaurants: ["yum", "tasty"])
        let nyc = Trip(name:"NYC Spring Break", location: "nyc", length: 3, days: [day1, day2] )
        let viewController = EditTripViewController(trip: nyc)
        present(viewController, animated: true, completion: nil)
    }
}
