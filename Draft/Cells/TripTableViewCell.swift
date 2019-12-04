//
//  TripTableViewCell.swift
//  Draft
//
//  Created by Olivia on 12/3/19.
//

import UIKit

class TripTableViewCell: UITableViewCell {

    var cellLabel: UILabel!

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        cellLabel = UILabel()
        cellLabel.text = "test"
        contentView.addSubview(cellLabel)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        
        cellLabel.snp.makeConstraints { (make) in
            make.top.bottom.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
