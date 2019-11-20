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
    let SPACING_96: CGFloat = 96
    let ILLUSTRATION_HEIGHT: CGFloat = 205
    
    let BREEZE = UIColor(red: 239/255, green: 246/255, blue: 255/255, alpha: 1.0)
    let SPACE = UIColor(red: 27/255, green: 31/255, blue: 35/255, alpha: 1.0)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .black
        
        flyingIllustration = UIImageView()
        flyingIllustration.image = UIImage(named: "flying-illustration")
        flyingIllustration.contentMode = .scaleAspectFill
        addSubview(flyingIllustration)
        
        taglineLabel = UILabel()
        taglineLabel.font = UIFont(name: "NewYorkMedium-Regular", size: 36)
        taglineLabel.text = "Start your next adventure"
        taglineLabel.textAlignment = .center
        taglineLabel.textColor = SPACE
        addSubview(taglineLabel)

        setupConstraints()
    }
    
    func setupConstraints() {
        flyingIllustration.snp.makeConstraints { (make) in
            make.top.equalTo(SPACING_96)
            make.width.equalToSuperview()
            make.height.equalTo(ILLUSTRATION_HEIGHT)
        }
        
        taglineLabel.snp.makeConstraints { (make) in
            make.top.equalTo(flyingIllustration.snp.bottom)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
