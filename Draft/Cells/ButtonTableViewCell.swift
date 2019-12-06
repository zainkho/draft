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
    
    func configure(for cell: InputCell? = nil, section: Int, index: Int, trip: Trip) {
        if index == 0 {
            topSeparator = UIView(frame: CGRect(x: 0, y: 0, width: contentView.frame.width, height: 0.25))
            topSeparator.backgroundColor = .RAIN
            contentView.addSubview(topSeparator)
        }
        
        if index == -1 {
            bottomSeparator = UIView(frame: CGRect(x: 0, y: contentView.frame.height - 0.25, width: contentView.frame.width, height: 0.25))
            bottomSeparator.backgroundColor = .RAIN
            contentView.addSubview(bottomSeparator)
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

