//
//  TripCollectionViewCell.swift
//  Draft
//
//  Created by Olivia on 11/16/19.
//

import UIKit
import SnapKit

class TripCollectionViewCell: UICollectionViewCell {
    var nameLabel: UILabel!
    var lengthLabel: UILabel!
    var attractionsLabel: UILabel!
    var restaurantsLabel: UILabel!
    var editButton: UIButton!
    
    var backgroundImage: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .none
        
        backgroundImage = UIImageView()
        backgroundImage.image = UIImage(named: "notecard-trip")
        backgroundImage.contentMode = .scaleAspectFill
        contentView.addSubview(backgroundImage)
        
        nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.contentMode = .scaleAspectFill
        nameLabel.layer.masksToBounds = true
        contentView.addSubview(nameLabel)
        
        lengthLabel = UILabel()
        lengthLabel.translatesAutoresizingMaskIntoConstraints = false
        lengthLabel.contentMode = .scaleAspectFill
        lengthLabel.layer.masksToBounds = true
        contentView.addSubview(lengthLabel)
        
        attractionsLabel = UILabel()
        attractionsLabel.translatesAutoresizingMaskIntoConstraints = false
        attractionsLabel.contentMode = .scaleAspectFill
        attractionsLabel.layer.masksToBounds = true
        contentView.addSubview(attractionsLabel)
        
        restaurantsLabel = UILabel()
        restaurantsLabel.translatesAutoresizingMaskIntoConstraints = false
        restaurantsLabel.contentMode = .scaleAspectFill
        restaurantsLabel.layer.masksToBounds = true
        contentView.addSubview(restaurantsLabel)
        
        editButton = UIButton()
        contentView.addSubview(editButton)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        backgroundImage.snp.makeConstraints { (make) in
            make.top.bottom.leading.trailing.equalToSuperview()
        }
    }
    
    func configure(for trip: Trip) {
        nameLabel.text = trip.name
        lengthLabel.text = String(trip.length)
        attractionsLabel.text = trip.days[0].attractions.joined(separator: ",")
        restaurantsLabel.text = trip.days[0].restaurants.joined(separator: ",")
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
