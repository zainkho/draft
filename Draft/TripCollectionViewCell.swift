//
//  TripCollectionViewCell.swift
//  Draft
//
//  Created by Olivia on 11/16/19.
//

import UIKit
import SnapKit

class TripCollectionViewCell: UICollectionViewCell {
    
    var trip: Trip!
    
    var backgroundImage: UIImageView!
    var nameLabel: UILabel!
    var lengthLabel: UILabel!
    var attractionsIcon: UIImageView!
    var attractionsLabel: UILabel!
    var restaurantsIcon: UIImageView!
    var restaurantsLabel: UILabel!
    var editButton: UIButton!
    
    let SPACING_4: CGFloat = 4
    let SPACING_6: CGFloat = 6
    let SPACING_8: CGFloat = 8
    let SPACING_12: CGFloat = 12
    let SPACING_16: CGFloat = 16
    let SPACING_24: CGFloat = 24
    let SPACING_48: CGFloat = 48
    let HEADER_TEXT_HEIGHT: CGFloat = 29
    let BODY_TEXT_HEIGHT: CGFloat = 19
    
    var SPACE = UIColor(red: 27/255, green: 31/255, blue: 35/255, alpha: 1.0)
    var OCEAN = UIColor(red: 68/255, green: 77/255, blue: 86/255, alpha: 1.0)
    
    var presentDelegate: PresentEditCardDelegate?
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .none
        
        self.layer.shadowOpacity = 0.12
        self.layer.shadowOffset = CGSize(width: 0, height: 1)
        self.layer.shadowRadius = 3
        
        backgroundImage = UIImageView()
        backgroundImage.image = UIImage(named: "notecard-trip")
        backgroundImage.contentMode = .scaleAspectFill
        contentView.addSubview(backgroundImage)
        
        nameLabel = UILabel()
        nameLabel.font = UIFont(name: "NewYorkMedium-Bold", size: 24)
        nameLabel.textColor = SPACE
        contentView.addSubview(nameLabel)
        
        lengthLabel = UILabel()
        lengthLabel.font = UIFont(name: "NewYorkMedium-Regular", size: 16)
        lengthLabel.textColor = OCEAN
        contentView.addSubview(lengthLabel)
        
        attractionsIcon = UIImageView()
        attractionsIcon.image = UIImage(named: "icon-attraction")
        attractionsIcon.contentMode = .scaleAspectFill
        contentView.addSubview(attractionsIcon)

        attractionsLabel = UILabel()
        attractionsLabel.font = UIFont(name: "NewYorkMedium-Regular", size: 16)
        attractionsLabel.textColor = OCEAN
        contentView.addSubview(attractionsLabel)
        
        restaurantsIcon = UIImageView()
        restaurantsIcon.image = UIImage(named: "icon-restaurant")
        restaurantsIcon.contentMode = .scaleAspectFill
        contentView.addSubview(restaurantsIcon)

        restaurantsLabel = UILabel()
        restaurantsLabel.font = UIFont(name: "NewYorkMedium-Regular", size: 16)
        restaurantsLabel.textColor = OCEAN
        contentView.addSubview(restaurantsLabel)
        
        editButton = UIButton()
        editButton.setBackgroundImage(UIImage(named: "icon-edit"), for: .normal)
        editButton.addTarget(self, action: #selector(presentEditViewController), for: .touchUpInside)
        contentView.addSubview(editButton)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        backgroundImage.snp.makeConstraints { (make) in
            make.top.bottom.leading.trailing.equalToSuperview()
        }
        
        nameLabel.snp.makeConstraints { (make) in
            make.top.leading.equalTo(SPACING_12)
            make.width.equalTo(contentView.frame.width - SPACING_12*2)
            make.height.equalTo(HEADER_TEXT_HEIGHT)
        }
        
        lengthLabel.snp.makeConstraints { (make) in
            make.top.equalTo(nameLabel.snp.bottom).offset(SPACING_8)
            make.leading.equalTo(SPACING_12)
            make.width.equalTo(contentView.frame.width - SPACING_12*2)
            make.height.equalTo(BODY_TEXT_HEIGHT)
        }
        
        attractionsIcon.snp.makeConstraints { (make) in
            make.top.equalTo(lengthLabel.snp.bottom).offset(SPACING_8)
            make.leading.equalTo(SPACING_12)
            make.width.height.equalTo(SPACING_16)
        }
        
        attractionsLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(attractionsIcon.snp.centerY)
            make.leading.equalTo(attractionsIcon.snp.trailing).offset(SPACING_8)
            make.width.equalTo(contentView.frame.width - SPACING_48)
            make.height.equalTo(BODY_TEXT_HEIGHT)
        }
        
        restaurantsIcon.snp.makeConstraints { (make) in
            make.top.equalTo(attractionsLabel.snp.bottom).offset(SPACING_8)
            make.leading.equalTo(SPACING_12)
            make.width.height.equalTo(SPACING_16)
        }
        
        restaurantsLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(restaurantsIcon.snp.centerY)
            make.leading.equalTo(restaurantsIcon.snp.trailing).offset(SPACING_8)
            make.width.equalTo(contentView.frame.width - SPACING_48)
            make.height.equalTo(BODY_TEXT_HEIGHT)
        }
        
        editButton.snp.makeConstraints { (make) in
            make.bottom.equalTo(contentView.snp.bottom).offset(-SPACING_16)
            make.right.equalTo(contentView.snp.right).offset(-SPACING_16)
            make.height.width.equalTo(SPACING_16)
        }
    }
    
    func configure(for trip: Trip) {
        nameLabel.text = trip.name
        lengthLabel.text = String(trip.length) + " days · " + trip.location
        attractionsLabel.text = trip.days[0].attractions.joined(separator: ", ")
        restaurantsLabel.text = trip.days[0].restaurants.joined(separator: ", ")
        self.trip = trip
    }
    
    @objc func presentEditViewController() {
        presentDelegate?.presentEditViewController(trip: trip, title: "Edit Trip")
    }
    
    func randomEmoji() -> String {
        let emojiStart = 0x1F601
        let ascii = emojiStart + Int(arc4random_uniform(UInt32(35)))
        let emoji = UnicodeScalar(ascii)?.description
        return emoji ?? "x"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
