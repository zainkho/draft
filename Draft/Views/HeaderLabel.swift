//
//  HeaderLabel.swift
//  Draft
//
//  Created by Zain Khoja on 11/21/19.
//

import UIKit
import SnapKit

class HeaderLabel: UIView {

    var headerLabel: UILabel!

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        headerLabel = UILabel()
        
        setupConstraints()
    }
    
    func setupConstraints() {
        
        headerLabel.snp.makeConstraints { (make) in
            
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
