//
//  STLoginView.swift
//  serieztv
//
//  Created by Goktug on 27/11/2016.
//  Copyright © 2016 serieztv. All rights reserved.
//

import UIKit

class STLoginView: UIView {
    
    let logo: UILabel = {
        let logo = UILabel()
        logo.text = "SeriezTV"
        logo.textColor = UIColor.black
        logo.textAlignment = NSTextAlignment.center
        logo.adjustsFontSizeToFitWidth = true
        return logo
    }()
    
    let emailField: UITextField = {
        let emailField = UITextField()
        emailField.placeholder = "Email"
        emailField.font = UIFont.systemFont(ofSize: 15)
        emailField.borderStyle = UITextBorderStyle.roundedRect
        emailField.autocorrectionType = UITextAutocorrectionType.no
        emailField.keyboardType = UIKeyboardType.emailAddress
        emailField.returnKeyType = UIReturnKeyType.done
        emailField.clearButtonMode = UITextFieldViewMode.whileEditing;
        emailField.contentVerticalAlignment = UIControlContentVerticalAlignment.center
        return emailField
    }()
    
    let passwordField: UITextField = {
        let passwordField = UITextField()
        passwordField.placeholder = "Password"
        passwordField.font = UIFont.systemFont(ofSize: 15)
        passwordField.borderStyle = UITextBorderStyle.roundedRect
        passwordField.autocorrectionType = UITextAutocorrectionType.no
        passwordField.keyboardType = UIKeyboardType.default
        passwordField.returnKeyType = UIReturnKeyType.done
        passwordField.clearButtonMode = UITextFieldViewMode.whileEditing;
        passwordField.contentVerticalAlignment = UIControlContentVerticalAlignment.center
        return passwordField
    }()
    
    let loginButton: UIButton = {
        let loginButton = UIButton()
        loginButton.setTitle("Login", for: .normal)
        loginButton.setTitleColor(UIColor.black, for: .normal)
        return loginButton
    }()
    
    let registerNavigateButton: UIButton = {
        let registerNavigateButton = UIButton()
        registerNavigateButton.setTitle("Register", for: .normal)
        registerNavigateButton.setTitleColor(UIColor.black, for: .normal)
        return registerNavigateButton
    }()
    
    override init (frame : CGRect) {
        super.init(frame : frame)
        self.backgroundColor = UIColor.white
        setupLoginView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLoginView() {
        self.addSubview(logo)
        self.addSubview(emailField)
        self.addSubview(passwordField)
        self.addSubview(loginButton)
        self.addSubview(registerNavigateButton)
        
        logo.snp.makeConstraints { (make) in
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
            make.height.equalTo(20)
        }
        
        emailField.snp.makeConstraints { (make) in
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
            make.top.equalTo(logo.snp.bottom).offset(15)
        }
        
        passwordField.snp.makeConstraints { (make) in
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
            make.top.equalTo(emailField.snp.bottom).offset(10)
        }
        
        loginButton.snp.makeConstraints { (make) in
            make.centerX.equalTo(self)
            make.centerY.equalTo(self)
            make.top.equalTo(passwordField.snp.bottom).offset(10)
            
        }
        
        registerNavigateButton.snp.makeConstraints { (make) in
            make.bottom.equalTo(self).offset(-10)
            make.centerX.equalTo(self)
            make.height.equalTo(20)
        }
        
    }
}
