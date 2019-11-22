//
//  HeaderLabel.swift
//  Draft
//
//  Created by Zain Khoja on 11/21/19.
//

import UIKit
import SnapKit

class HeaderLabelView: UIView {

    var headerLabel: UILabel!
    var dayNum: Int!
    
    var LABEL_HEIGHT: CGFloat = 29
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        headerLabel = UILabel()
        headerLabel.font = UIFont.H1
        headerLabel.text = "test"
        headerLabel.textColor = .SPACE
        addSubview(headerLabel)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        
        headerLabel.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview().offset(-SPACING_12)
            make.leading.equalToSuperview().offset(SPACING_16)
            make.trailing.equalToSuperview().offset(-SPACING_16)
            make.height.equalTo(LABEL_HEIGHT)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
