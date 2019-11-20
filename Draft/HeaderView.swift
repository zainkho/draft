//
//  HeaderView.swift
//  Draft
//
//  Created by Zain Khoja on 11/18/19.
//

import UIKit
import SnapKit

class HeaderView: UICollectionReusableView {
 
    var draftImageView: UIImageView!
    var newTripButton: UIButton!
    
    let SPACING_8: CGFloat = 8
    let SPACING_12: CGFloat = 12
    let SPACING_16: CGFloat = 16
    let SPACING_24: CGFloat = 24
    let LOGO_HEIGHT: CGFloat = 80
    let LOGO_WIDTH: CGFloat = 209
    
    var SPACE = UIColor(red: 27/255, green: 31/255, blue: 35/255, alpha: 1.0)
    
    var presentDelegate: PresentEditCardDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        draftImageView = UIImageView()
        draftImageView.image = UIImage(named: "draft-logo")
        draftImageView.contentMode = .scaleAspectFill
        addSubview(draftImageView)
        
        newTripButton = UIButton()
        newTripButton.setTitle("+ Start a new adventure", for: .normal)
        newTripButton.titleLabel?.font = UIFont(name: "NewYorkMedium-Regular", size: 24)
        newTripButton.setTitleColor(SPACE, for: .normal)
        newTripButton.setBackgroundImage(UIImage(named: "notecard-button"), for: .normal)
        newTripButton.layer.cornerRadius = 12
        newTripButton.layer.shadowOpacity = 0.12
        newTripButton.layer.shadowOffset = CGSize(width: 0, height: 1)
        newTripButton.layer.shadowRadius = 3
        addSubview(newTripButton)
        
        newTripButton.addTarget(self, action: #selector(presentEditViewController), for: .touchUpInside)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        
        // draftImageView
        draftImageView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.height.equalTo(LOGO_HEIGHT)
            make.width.equalTo(LOGO_WIDTH)
            make.centerX.equalTo(self.snp.centerX)
        }
        
        // newTripButton
        newTripButton.snp.makeConstraints { (make) in
            make.top.equalTo(draftImageView.snp.bottom).offset(SPACING_12)
            make.height.equalTo(50)
            make.leading.equalTo(SPACING_16)
            make.trailing.equalTo(-SPACING_16)
        }
    }
    
    @objc func presentEditViewController() {
        presentDelegate?.presentEditViewController(trip: Trip(emoji: randomEmoji(), name: "New trip", location: "", length: 1, days: [Day(num: 1, attractions: [], restaurants: [])]), title: "New Trip")
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
