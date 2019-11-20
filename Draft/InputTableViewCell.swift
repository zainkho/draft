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
        
        inputField = UITextField()
        inputField.backgroundColor = .white
        inputField.text = inputFieldText
        inputField.textColor = .black
        contentView.addSubview(inputField)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        inputField.snp.makeConstraints { (make) in
            make.top.bottom.leading.trailing.equalToSuperview()
        }
    }
    
    func configure(for cell: InputCell) {
        self.inputFieldText = cell.text
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
