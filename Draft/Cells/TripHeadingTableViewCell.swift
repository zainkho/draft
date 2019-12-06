//
//  TripHeadingTableViewCell.swift
//  Draft
//
//  Created by Olivia on 12/5/19.
//

import UIKit

class TripHeadingTableViewCell: UITableViewCell {
    
    var cellLabel: UILabel!
    var img: String!
    var cellType: tripCellType!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = .none
        self.selectionStyle = .none
        
        cellLabel = UILabel()
        cellLabel.backgroundColor = .clear
        cellLabel.font = UIFont.BODY
        cellLabel.textColor = .DUSK
        contentView.addSubview(cellLabel)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        
        cellLabel.snp.makeConstraints { (make) in
            make.top.bottom.equalToSuperview()
            make.leading.equalToSuperview().offset(SPACING_16)
            make.trailing.equalToSuperview().offset(-SPACING_16)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
