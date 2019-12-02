//
//  LoginViewController.swift
//  Draft
//
//  Created by Zain Khoja on 12/1/19.
//

import UIKit
import SnapKit

class LoginViewController: UIViewController {
    
    var draftImageView: UIImageView!
    var usernameLabel: UILabel!
    var usernameField: UITextField!
    var usernameFieldPadding: UIView!
    var passwordLabel: UILabel!
    var passwordField: UITextField!
    var passwordFieldPadding: UIView!
    var loginButton: UIButton!
    
    let LOGO_HEIGHT: CGFloat = 80
    let LOGO_WIDTH: CGFloat = 209
    let LABEL_HEIGHT: CGFloat = 20
    let FIELD_HEIGHT: CGFloat = 50
    let BUTTON_HEIGHT: CGFloat = 50
    
    let attrs = [
        NSAttributedString.Key.foregroundColor: UIColor.RAIN,
        NSAttributedString.Key.font: UIFont.H2!
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        
        view.backgroundColor = .BREEZE
        
        draftImageView = UIImageView()
        draftImageView.image = UIImage(named: "draft-logo")
        draftImageView.contentMode = .scaleAspectFill
        view.addSubview(draftImageView)
        
        usernameLabel = UILabel()
        usernameLabel.font = UIFont.LABEL
        usernameLabel.text = "Username"
        usernameLabel.textColor = .SPACE
        view.addSubview(usernameLabel)
        
        usernameField = UITextField()
        usernameField.attributedPlaceholder = NSAttributedString(string: "Marco Pollo", attributes: attrs)
        usernameFieldPadding = UIView(frame: CGRect(x: 0, y: 0, width: SPACING_12, height: FIELD_HEIGHT))
        usernameField.leftView = usernameFieldPadding
        usernameField.leftViewMode = .always
        usernameField.textColor = .SPACE
        usernameField.autocapitalizationType = .none
        usernameField.backgroundColor = .CREAM
        usernameField.font = UIFont.H2
        usernameField.layer.cornerRadius = 12
        usernameField.layer.borderWidth = 1
        usernameField.layer.borderColor = UIColor.SPACE.cgColor
        view.addSubview(usernameField)
        
        passwordLabel = UILabel()
        passwordLabel.font = UIFont.LABEL
        passwordLabel.text = "Password"
        passwordLabel.textColor = .SPACE
        view.addSubview(passwordLabel)
        
        passwordField = UITextField()
        passwordField.isSecureTextEntry = true
        passwordField.attributedPlaceholder = NSAttributedString(string: "Enter a password...", attributes: attrs)
        passwordFieldPadding = UIView(frame: CGRect(x: 0, y: 0, width: SPACING_12, height: FIELD_HEIGHT))
        passwordField.leftView = passwordFieldPadding
        passwordField.leftViewMode = .always
        passwordField.textColor = .SPACE
        passwordField.autocapitalizationType = .none
        passwordField.backgroundColor = .CREAM
        passwordField.font = UIFont.H2
        passwordField.layer.cornerRadius = 12
        passwordField.layer.borderWidth = 1
        passwordField.layer.borderColor = UIColor.SPACE.cgColor
        view.addSubview(passwordField)
        
        loginButton = UIButton()
        loginButton.setTitle("Start your journey", for: .normal)
        loginButton.titleLabel?.font = UIFont.H2
        loginButton.setTitleColor(.SPACE, for: .normal)
        loginButton.setBackgroundImage(UIImage(named: "notecard-button"), for: .normal)
        loginButton.layer.cornerRadius = 12
        loginButton.layer.shadowOpacity = 0.12
        loginButton.layer.shadowOffset = CGSize(width: 0, height: 1)
        loginButton.layer.shadowRadius = 3
        view.addSubview(loginButton)
        
        loginButton.addTarget(self, action: #selector(login), for: .touchUpInside)
        
        setupConstraints()
        
    }
    
    func setupConstraints() {
        
        // draftImageView
        draftImageView.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.topMargin)
            make.height.equalTo(LOGO_HEIGHT)
            make.width.equalTo(LOGO_WIDTH)
            make.centerX.equalTo(view.snp.centerX)
        }
        
        // usernameLabel
        usernameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(draftImageView.snp.bottomMargin).offset(SPACING_72)
            make.height.equalTo(LABEL_HEIGHT)
            make.leading.trailing.equalToSuperview().inset(SPACING_16)
        }
        
        // usernameField
        usernameField.snp.makeConstraints { (make) in
            make.top.equalTo(usernameLabel.snp.bottomMargin).offset(SPACING_12)
            make.height.equalTo(FIELD_HEIGHT)
            make.leading.trailing.equalToSuperview().inset(SPACING_16)
        }
        
        // passwordLabel
        passwordLabel.snp.makeConstraints { (make) in
            make.top.equalTo(usernameField.snp.bottomMargin).offset(SPACING_48)
            make.height.equalTo(LABEL_HEIGHT)
            make.leading.trailing.equalToSuperview().inset(SPACING_16)
        }
        
        // passwordField
        passwordField.snp.makeConstraints { (make) in
            make.top.equalTo(passwordLabel.snp.bottomMargin).offset(SPACING_12)
            make.height.equalTo(FIELD_HEIGHT)
            make.leading.trailing.equalToSuperview().inset(SPACING_16)
        }

        // loginButton
        loginButton.snp.makeConstraints { (make) in
            make.top.equalTo(passwordField.snp.bottom).offset(SPACING_48)
            make.height.equalTo(BUTTON_HEIGHT)
            make.leading.trailing.equalToSuperview().inset(SPACING_16)
        }
    }
    
    @objc func login() {
        
    }

}
