//
//  EmptyStateView.swift
//  Draft
//
//  Created by Zain Khoja on 11/19/19.
//
import UIKit
import SnapKit

class EmptyStateView: UIView {
    
    var flyingIllustration: UIImageView!
    var taglineLabel: UILabel!
    var startButton: UIButton!

    let ILLUSTRATION_SPACING: CGFloat = 96
    let ILLUSTRATION_HEIGHT: CGFloat = 205
    let TAGLINE_HEIGHT: CGFloat = 144
    let BUTTON_HEIGHT: CGFloat = 50
    
    var presentDelegate: PresentNewTripDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .BREEZE
        
        flyingIllustration = UIImageView()
        flyingIllustration.image = UIImage(named: "flying-illustration")
        flyingIllustration.contentMode = .scaleAspectFill
        addSubview(flyingIllustration)
        
        taglineLabel = UILabel()
        taglineLabel.font = UIFont.TITLE
        taglineLabel.text = "Start your next \nadventure"
        taglineLabel.textAlignment = .center
        taglineLabel.numberOfLines = 0
        taglineLabel.textColor = .SPACE
        addSubview(taglineLabel)
        
        startButton = UIButton()
        startButton.setTitle("+ Begin traveling", for: .normal)
        startButton.titleLabel?.font = UIFont.H2
        startButton.setTitleColor(.SPACE, for: .normal)
        startButton.setBackgroundImage(UIImage(named: "notecard-button"), for: .normal)
        startButton.layer.cornerRadius = 12
        startButton.layer.shadowOpacity = 0.12
        startButton.layer.shadowOffset = CGSize(width: 0, height: 1)
        startButton.layer.shadowRadius = 3
        addSubview(startButton)
        
        startButton.addTarget(self, action: #selector(presentEditViewController), for: .touchUpInside)

        setupConstraints()
    }
    
    func setupConstraints() {

        flyingIllustration.snp.makeConstraints { (make) in
            make.top.equalTo(ILLUSTRATION_SPACING)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(ILLUSTRATION_HEIGHT)
        }
        
        taglineLabel.snp.makeConstraints { (make) in
            make.top.equalTo(flyingIllustration.snp.bottom)
            make.leading.trailing.equalToSuperview()
        }
        
        startButton.snp.makeConstraints { (make) in
            make.top.equalTo(taglineLabel.snp.bottom).offset(SPACING_24)
            make.height.equalTo(BUTTON_HEIGHT)
            make.leading.equalTo(SPACING_16)
            make.trailing.equalTo(-SPACING_16)
        }
    }
    
    @objc func presentEditViewController() {
        presentDelegate?.presentNewTripViewController(trip: Trip(emoji: randomEmoji(), name: "New trip", location: "", days: [Day(num: 1, attractions: [""], restaurants: [""])]), title: "New Trip")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
