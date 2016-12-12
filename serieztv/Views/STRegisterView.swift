//
//  STRegisterView.swift
//  serieztv
//
//  Created by Goktug on 27/11/2016.
//  Copyright © 2016 serieztv. All rights reserved.
//

import UIKit

class STRegisterView: UIView {
    
    let backgroundImageView: UIImageView = {
        let backgroundImageView = UIImageView()
        return backgroundImageView
    }()
    
    let backButton: UIButton = {
        let backButton = UIButton()
        backButton.setBackgroundImage(UIImage(named: "back"), for: .normal)
        return backButton
    }()
    
    let logo: UILabel = {
        let logo = UILabel()
        logo.text = "seriezTV"
        logo.textColor = UIColor.white
        logo.textAlignment = NSTextAlignment.center
        logo.font = UIFont.systemFont(ofSize: 50)
        logo.adjustsFontSizeToFitWidth = true
        return logo
    }()
    
    let emailField: STTextField = {
        let emailField = STTextField(frame: CGRect.zero, placeholder: "Email", image: UIImage(named:"email")!)
        emailField.autocorrectionType = UITextAutocorrectionType.no
        emailField.keyboardType = UIKeyboardType.emailAddress
        emailField.returnKeyType = UIReturnKeyType.continue
        emailField.clearButtonMode = UITextFieldViewMode.whileEditing;
        emailField.contentVerticalAlignment = UIControlContentVerticalAlignment.center
        emailField.tag = 0
        return emailField
    }()
    
    let usernameField: STTextField = {
        let usernameField = STTextField(frame: CGRect.zero, placeholder: "Username", image: UIImage(named:"user")!)
        usernameField.autocorrectionType = UITextAutocorrectionType.no
        usernameField.keyboardType = UIKeyboardType.default
        usernameField.returnKeyType = UIReturnKeyType.continue
        usernameField.clearButtonMode = UITextFieldViewMode.whileEditing;
        usernameField.contentVerticalAlignment = UIControlContentVerticalAlignment.center
        usernameField.tag = 1
        return usernameField
    }()
    
    let passwordField: UITextField = {
        let passwordField = STTextField(frame: CGRect.zero, placeholder: "Password", image: UIImage(named:"password")!)
        passwordField.autocorrectionType = UITextAutocorrectionType.no
        passwordField.keyboardType = UIKeyboardType.default
        passwordField.returnKeyType = UIReturnKeyType.done
        passwordField.clearButtonMode = UITextFieldViewMode.whileEditing;
        passwordField.contentVerticalAlignment = UIControlContentVerticalAlignment.center
        passwordField.tag = 2
        return passwordField
    }()
    
    let registerButton: UIButton = {
        let registerButton = UIButton()
        registerButton.setTitle("Sign Up", for: .normal)
        registerButton.setTitleColor(UIColor(colorLiteralRed: 251/255, green: 249/255, blue: 243/255, alpha: 1.0), for:.normal)
        registerButton.backgroundColor = UIColor(colorLiteralRed: 238/255, green: 99/255, blue: 131/255, alpha: 1.0)
        registerButton.layer.cornerRadius = 20
        registerButton.layer.borderWidth = 1
        return registerButton
    }()
    
    override init (frame : CGRect) {
        super.init(frame : frame)
        self.backgroundColor = UIColor.black
        setupRegisterView()
        self.backgroundImageView.alpha = 0.5
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupRegisterView() {
        self.addSubview(backgroundImageView)
        self.addSubview(backButton)
        self.addSubview(logo)
        self.addSubview(emailField)
        self.addSubview(usernameField)
        self.addSubview(passwordField)
        self.addSubview(registerButton)
        
        backgroundImageView.snp.makeConstraints { (make) in
            make.top.equalTo(self.snp.top)
            make.bottom.equalTo(self.snp.bottom)
            make.leading.equalTo(self.snp.leading)
            make.trailing.equalTo(self.snp.trailing)
        }
        
        backButton.snp.makeConstraints { (make) in
            make.top.equalTo(40)
            make.leading.equalTo(20)
        }
        
        logo.snp.makeConstraints { (make) in
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
            make.top.equalTo(100)
        }
        
        emailField.snp.makeConstraints { (make) in
            make.leading.equalTo(30)
            make.trailing.equalTo(-30)
            make.centerY.equalTo(self)
            make.height.equalTo(40)
        }
        
        usernameField.snp.makeConstraints { (make) in
            make.leading.equalTo(30)
            make.trailing.equalTo(-30)
            make.top.equalTo(emailField.snp.bottom).offset(15)
            make.height.equalTo(40)
        }
        
        passwordField.snp.makeConstraints { (make) in
            make.leading.equalTo(30)
            make.trailing.equalTo(-30)
            make.top.equalTo(usernameField.snp.bottom).offset(15)
            make.height.equalTo(40)
        }
        
        registerButton.snp.makeConstraints { (make) in
            make.centerX.equalTo(self)
            make.leading.equalTo(30)
            make.trailing.equalTo(-30)
            make.height.equalTo(50)
            make.top.equalTo(passwordField.snp.bottom).offset(30)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.registerButton.layer.shadowColor = UIColor.black.cgColor
        self.registerButton.layer.shadowOpacity = 1
        self.registerButton.layer.shadowOffset = CGSize.zero
        self.registerButton.layer.shadowRadius = 20
    }



}
