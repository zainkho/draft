//
//  ButtonFooterView.swift
//  Draft
//
//  Created by Zain Khoja on 12/5/19.
//

import UIKit

class ButtonFooterView: UIView {

    var addDayButton: UIButton!
    var addDayDelegate: AddDayDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        addDayButton = UIButton()
        addDayButton.setTitle("+ Add a new day", for: .normal)
        addDayButton.titleLabel?.font = UIFont.H2
        addDayButton.setTitleColor(.SPACE, for: .normal)
        addDayButton.setBackgroundImage(UIImage(named: "notecard-button"), for: .normal)
        addDayButton.layer.cornerRadius = 12
        addDayButton.layer.shadowOpacity = 0.12
        addDayButton.layer.shadowOffset = CGSize(width: 0, height: 1)
        addDayButton.layer.shadowRadius = 3
        addSubview(addDayButton)
        
        addDayButton.addTarget(self, action: #selector(addDay), for: .touchUpInside)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        
        // addDayButton
        addDayButton.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(SPACING_24)
            make.height.equalTo(50)
            make.leading.trailing.equalToSuperview().inset(SPACING_16)
        }
    }
    
    @objc func addDay() {
        print("here1")
        self.addDayDelegate?.addDay()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
