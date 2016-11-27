//
//  STLoginView.swift
//  serieztv
//
//  Created by Goktug on 27/11/2016.
//  Copyright © 2016 serieztv. All rights reserved.
//

import UIKit

class STLoginView: UIView {
    
    let backgroundImageView: UIImageView = {
        let backgroundImageView = UIImageView()
        return backgroundImageView
    }()
    
    let logo: UILabel = {
        let logo = UILabel()
        logo.text = "SeriezTV"
        logo.textColor = UIColor(colorLiteralRed: 100/255, green: 149/255, blue: 237/255, alpha: 1.0)
        logo.textAlignment = NSTextAlignment.center
        logo.adjustsFontSizeToFitWidth = true
        return logo
    }()
    
    let emailField: UITextField = {
        let emailField = UITextField()
        emailField.textColor = UIColor.white
        emailField.attributedPlaceholder = NSAttributedString(string:"Email", attributes: [NSForegroundColorAttributeName: UIColor(colorLiteralRed: 236/255, green: 235/255, blue: 232/255, alpha: 1.0)])
        emailField.keyboardAppearance = UIKeyboardAppearance.dark;
        emailField.backgroundColor = UIColor(colorLiteralRed: 25/255, green: 20/255, blue: 20/255, alpha: 1.0)
        emailField.font = UIFont.systemFont(ofSize: 15)
        emailField.borderStyle = UITextBorderStyle.roundedRect
        emailField.autocorrectionType = UITextAutocorrectionType.no
        emailField.keyboardType = UIKeyboardType.emailAddress
        emailField.returnKeyType = UIReturnKeyType.continue
        emailField.clearButtonMode = UITextFieldViewMode.whileEditing;
        emailField.contentVerticalAlignment = UIControlContentVerticalAlignment.center
        return emailField
    }()
    
    let passwordField: UITextField = {
        let passwordField = UITextField()
        passwordField.attributedPlaceholder = NSAttributedString(string:"Password", attributes: [NSForegroundColorAttributeName: UIColor(colorLiteralRed: 236/255, green: 235/255, blue: 232/255, alpha: 1.0)])
        passwordField.textColor = UIColor.white
        passwordField.backgroundColor = UIColor(colorLiteralRed: 25/255, green: 20/255, blue: 20/255, alpha: 1.0)
        passwordField.font = UIFont.systemFont(ofSize: 15)
        passwordField.borderStyle = UITextBorderStyle.roundedRect
        passwordField.autocorrectionType = UITextAutocorrectionType.no
        passwordField.keyboardType = UIKeyboardType.default
        passwordField.keyboardAppearance = UIKeyboardAppearance.dark;
        passwordField.returnKeyType = UIReturnKeyType.done
        passwordField.clearButtonMode = UITextFieldViewMode.whileEditing;
        passwordField.contentVerticalAlignment = UIControlContentVerticalAlignment.center
        return passwordField
    }()
    
    let loginButton: UIButton = {
        let loginButton = UIButton()
        loginButton.setTitle("Login", for: .normal)
        loginButton.setTitleColor(UIColor(colorLiteralRed: 236/255, green: 235/255, blue: 232/255, alpha: 1.0), for:.normal)
        loginButton.backgroundColor = UIColor(colorLiteralRed: 100/255, green: 149/255, blue: 237/255, alpha: 1.0)
        return loginButton
    }()
    
    let registerNavigateButton: UIButton = {
        let registerNavigateButton = UIButton()
        registerNavigateButton.setTitle("Register", for: .normal)
        registerNavigateButton.setTitleColor(UIColor(colorLiteralRed: 236/255, green: 235/255, blue: 232/255, alpha: 1.0), for:.normal)
        registerNavigateButton.backgroundColor = UIColor(colorLiteralRed: 100/255, green: 149/255, blue: 237/255, alpha: 1.0)
        return registerNavigateButton
    }()
    
    override init (frame : CGRect) {
        super.init(frame : frame)
        self.backgroundColor = UIColor(colorLiteralRed: 25/255, green: 20/255, blue: 20/255, alpha: 1.0)
        setupLoginView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLoginView() {
        self.addSubview(backgroundImageView)
        self.addSubview(logo)
        self.addSubview(emailField)
        self.addSubview(passwordField)
        self.addSubview(loginButton)
        self.addSubview(registerNavigateButton)
        
        
        
        backgroundImageView.snp.makeConstraints { (make) in
            make.top.equalTo(self.snp.top)
            make.bottom.equalTo(self.snp.bottom)
            make.leading.equalTo(self.snp.leading)
            make.trailing.equalTo(self.snp.trailing)
        }
        
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
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
            make.top.equalTo(passwordField.snp.bottom).offset(10)
            
        }
        
        registerNavigateButton.snp.makeConstraints { (make) in
            make.bottom.equalTo(self).offset(-10)
            make.centerX.equalTo(self)
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
        }
        
    }
}
