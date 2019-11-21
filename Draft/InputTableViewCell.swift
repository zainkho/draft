//
//  InputTableViewCell.swift
//  Draft
//
//  Created by Olivia on 11/19/19.
//

import UIKit
import SnapKit

class InputTableViewCell: UITableViewCell {

    var inputField: UITextField!
    var inputFieldText: String!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = .CREAM
        
        let attrs = [
            NSAttributedString.Key.foregroundColor: UIColor.RAIN,
            NSAttributedString.Key.font: UIFont.LABEL!
        ]
        
        inputField = UITextField()
        inputField.backgroundColor = .CLOUD
        inputField.attributedPlaceholder = NSAttributedString(string: "Empire State Building", attributes: attrs)
        inputField.font = UIFont.LABEL
        inputField.text = inputFieldText
        inputField.textColor = .SPACE
        
        contentView.addSubview(inputField)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        
        inputField.snp.makeConstraints { (make) in
            make.top.bottom.equalToSuperview()
            make.leading.equalToSuperview().offset(SPACING_16)
            make.trailing.equalToSuperview().offset(-SPACING_16)
        }
    }
    
    func configure(for cell: InputCell) {
        self.inputFieldText = cell.text
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
