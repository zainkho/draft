//
//  TripViewController.swift
//  Draft
//
//  Created by Zain Khoja on 11/19/19.
//

import UIKit
import SnapKit
import Kingfisher

class TripViewController: UIViewController {
    
    var trip: Trip!
    var tableView: UITableView!
    var backgroundImage: UIImageView!
    
    var headerImageView: UIImageView!
    var emojiLabel: UILabel!
    var titleLabel: UILabel!
    var subtitleLabel: UILabel!
    
    let TITLE_TEXT_HEIGHT: CGFloat = 41
    let HEADER_TEXT_HEIGHT: CGFloat = 29
    let BODY_TEXT_HEIGHT: CGFloat = 19
    var HEADER_HEIGHT: CGFloat = 168
    
    let BREEZE = UIColor(red: 239/255, green: 246/255, blue: 255/255, alpha: 1.0)
    var CREAM = UIColor(red: 255/255, green: 251/255, blue: 242/255, alpha: 1.0)
    var SPACE = UIColor(red: 27/255, green: 31/255, blue: 35/255, alpha: 1.0)
    var OCEAN = UIColor(red: 68/255, green: 77/255, blue: 86/255, alpha: 1.0)
    var RAIN = UIColor(red: 162/255, green: 162/255, blue: 162/255, alpha: 1.0)
    
    init(trip: Trip) {
        self.trip = trip
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = CREAM
        
        backgroundImage = UIImageView()
        backgroundImage.image = UIImage(named: "notecard-details")
        backgroundImage.contentMode = .scaleAspectFill
        view.addSubview(backgroundImage)
        
        headerImageView = UIImageView()
        headerImageView.backgroundColor = .darkGray
        headerImageView.kf.setImage(with: URL(string: "https://images.unsplash.com/photo-1535726917010-060104716686?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max&ixid=eyJhcHBfaWQiOjEwMjY4OH0"))
        headerImageView.contentMode = .scaleAspectFill
        headerImageView.clipsToBounds = true
        view.addSubview(headerImageView)
        
        emojiLabel = UILabel()
        emojiLabel.font = UIFont.TITLE
        emojiLabel.text = trip.emoji
        view.addSubview(emojiLabel)
        
        titleLabel = UILabel()
        titleLabel.font = UIFont.TITLE
        titleLabel.text = trip.name
        titleLabel.textColor = SPACE
        view.addSubview(titleLabel)
        
        subtitleLabel = UILabel()
        subtitleLabel.font = UIFont.LABEL
        subtitleLabel.text = String(trip.length) + " days · " + trip.location
        subtitleLabel.textColor = OCEAN
        view.addSubview(subtitleLabel)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        
        headerImageView.snp.makeConstraints { (make) in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(HEADER_HEIGHT)
        }
        
        emojiLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(headerImageView.snp.bottom)
            make.leading.equalTo(SPACING_16)
            make.width.equalTo(view.frame.width - SPACING_16*2)
            make.height.equalTo(TITLE_TEXT_HEIGHT)
        }
        
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(emojiLabel.snp.bottom)
            make.leading.equalTo(SPACING_16)
            make.width.equalTo(view.frame.width - SPACING_16*2)
            make.height.equalTo(TITLE_TEXT_HEIGHT)
        }
        
        backgroundImage.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(SPACING_8)
            make.leading.bottom.trailing.equalToSuperview()
        }
        
        subtitleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(SPACING_4)
            make.leading.equalTo(SPACING_16)
            make.width.equalTo(view.frame.width - SPACING_16*2)
            make.height.equalTo(BODY_TEXT_HEIGHT)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
