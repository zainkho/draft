//
//  EmptyState.swift
//  Draft
//
//  Created by Zain Khoja on 11/19/19.
//

import UIKit
import SnapKit

class EmptyState: UIView {
    
    var flyingIllustration: UIImageView!
    var taglineLabel: UILabel!
    var startButton: UIButton!

    let SPACING_8: CGFloat = 8
    let SPACING_12: CGFloat = 12
    let SPACING_16: CGFloat = 16
    let SPACING_24: CGFloat = 24
    let SPACING_48: CGFloat = 48
    let SPACING_120: CGFloat = 120
    let ILLUSTRATION_HEIGHT: CGFloat = 205
    let TAGLINE_HEIGHT: CGFloat = 144
    let BUTTON_HEIGHT: CGFloat = 50
    
    let BREEZE = UIColor(red: 239/255, green: 246/255, blue: 255/255, alpha: 1.0)
    let SPACE = UIColor(red: 27/255, green: 31/255, blue: 35/255, alpha: 1.0)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = BREEZE
        
        flyingIllustration = UIImageView()
        flyingIllustration.image = UIImage(named: "flying-illustration")
        flyingIllustration.contentMode = .scaleAspectFill
        addSubview(flyingIllustration)
        
        taglineLabel = UILabel()
        taglineLabel.font = UIFont(name: "NewYorkMedium-Regular", size: 36)
        taglineLabel.text = "Start your next \nadventure"
        taglineLabel.textAlignment = .center
        taglineLabel.numberOfLines = 0
        taglineLabel.textColor = SPACE
        addSubview(taglineLabel)
        
        startButton = UIButton()
        startButton.setTitle("+ Begin traveling", for: .normal)
        startButton.titleLabel?.font = UIFont(name: "NewYorkMedium-Regular", size: 24)
        startButton.setTitleColor(SPACE, for: .normal)
        startButton.setBackgroundImage(UIImage(named: "notecard-button"), for: .normal)
        startButton.layer.cornerRadius = 12
        startButton.layer.shadowOpacity = 0.12
        startButton.layer.shadowOffset = CGSize(width: 0, height: 1)
        startButton.layer.shadowRadius = 3
        addSubview(startButton)
        
        startButton.addTarget(self, action: #selector(startButtonPush), for: .touchUpInside)

        setupConstraints()
    }
    
    func setupConstraints() {
        flyingIllustration.snp.makeConstraints { (make) in
            make.top.equalTo(SPACING_120)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(ILLUSTRATION_HEIGHT)
        }
        
        taglineLabel.snp.makeConstraints { (make) in
            make.top.equalTo(flyingIllustration.snp.bottom)
            make.width.equalToSuperview()
        }
        
        startButton.snp.makeConstraints { (make) in
            make.top.equalTo(taglineLabel.snp.bottom).offset(SPACING_12)
            make.height.equalTo(BUTTON_HEIGHT)
            make.leading.equalTo(SPACING_16)
            make.trailing.equalTo(-SPACING_16)
        }
    }
    
    @objc func startButtonPush() {
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
