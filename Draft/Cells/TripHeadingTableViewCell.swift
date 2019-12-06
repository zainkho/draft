//
//  TripHeadingTableViewCell.swift
//  Draft
//
//  Created by Olivia on 12/5/19.
//

import UIKit

class TripHeadingTableViewCell: UITableViewCell {
    
    var cellLabel: UILabel!
    var iconImageView: UIImageView!
    var img: String!
    var cellType: tripCellType!
    
    let LABEL_HEIGHT = 20
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = .none
        self.selectionStyle = .none
        
        iconImageView = UIImageView()
        iconImageView.image = UIImage(named: "icon-attraction")
        iconImageView.contentMode = .scaleAspectFill
        iconImageView.clipsToBounds = true
        contentView.addSubview(iconImageView)

        cellLabel = UILabel()
        cellLabel.backgroundColor = .clear
        cellLabel.font = UIFont.LABEL
        cellLabel.textColor = .RAIN
        contentView.addSubview(cellLabel)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        
        iconImageView.snp.makeConstraints { (make) in
            make.bottom.equalTo(contentView.snp.bottom)
            make.leading.equalTo(SPACING_16)
            make.width.height.equalTo(SPACING_16)
        }
        
        cellLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(iconImageView.snp.centerY)
            make.leading.equalTo(iconImageView.snp.trailing).offset(SPACING_8)
            make.trailing.equalToSuperview().offset(-SPACING_16)
            make.height.equalTo(LABEL_HEIGHT)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
