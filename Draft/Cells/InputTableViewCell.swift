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
    var cellType: cellType!
    
    var didModifyInputField: ((String) -> Void)?
    
    let attrs = [
        NSAttributedString.Key.foregroundColor: UIColor.RAIN,
        NSAttributedString.Key.font: UIFont.LABEL!
    ]
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = .CLOUD
        self.selectionStyle = .none
        
        inputField = UITextField()
        inputField.backgroundColor = .CLOUD
        inputField.font = UIFont.LABEL
        inputField.textColor = .SPACE
        inputField.addTarget(self, action: #selector(inputFieldTextDidChange), for: .editingChanged)
        contentView.addSubview(inputField)

        setupConstraints()
    }
    
    @objc private func inputFieldTextDidChange() {
        didModifyInputField?(inputField.text ?? "")
    }
    
    func setupConstraints() {
        
        inputField.snp.makeConstraints { (make) in
            make.top.bottom.equalToSuperview()
            make.leading.equalToSuperview().offset(SPACING_16)
            make.trailing.equalToSuperview().offset(-SPACING_16)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
