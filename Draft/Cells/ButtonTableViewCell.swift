//
//  ButtonTableViewCell.swift
//  Draft
//
//  Created by Olivia on 11/26/19.
//

import UIKit

class ButtonTableViewCell: UITableViewCell {

    var buttonLabel: UILabel!
    var topSeparator: UIView!
    var bottomSeparator: UIView!
    var cellType: cellType!
    
    let attrs = [
        NSAttributedString.Key.foregroundColor: UIColor.RAIN,
        NSAttributedString.Key.font: UIFont.LABEL!
    ]
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = .CLOUD
        
        buttonLabel = UILabel()
        buttonLabel.backgroundColor = .CLOUD
        buttonLabel.font = UIFont.LABEL
        buttonLabel.textColor = .SPACE
        contentView.addSubview(buttonLabel)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        buttonLabel.snp.makeConstraints { (make) in
            make.top.bottom.equalToSuperview()
            make.leading.equalToSuperview().offset(SPACING_16)
            make.trailing.equalToSuperview().offset(-SPACING_16)
        }
    }
        
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

