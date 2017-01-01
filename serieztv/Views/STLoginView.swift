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
    
    let usernameField: STTextField = {
        let usernameField = STTextField(frame: CGRect.zero, placeholder: "Username", image: UIImage(named:"userfield")!)
        usernameField.autocorrectionType = UITextAutocorrectionType.no
        usernameField.keyboardType = UIKeyboardType.emailAddress
        usernameField.returnKeyType = UIReturnKeyType.continue
        usernameField.clearButtonMode = UITextFieldViewMode.whileEditing;
        usernameField.contentVerticalAlignment = UIControlContentVerticalAlignment.center
        usernameField.tag = 0
        return usernameField
    }()
    
    let passwordField: UITextField = {
        let passwordField = STTextField(frame: CGRect.zero, placeholder: "Password", image: UIImage(named:"password")!)
        passwordField.autocorrectionType = UITextAutocorrectionType.no
        passwordField.keyboardType = UIKeyboardType.default
        passwordField.returnKeyType = UIReturnKeyType.done
        passwordField.clearButtonMode = UITextFieldViewMode.whileEditing;
        passwordField.contentVerticalAlignment = UIControlContentVerticalAlignment.center
        passwordField.tag = 1
        return passwordField
    }()
    
    let loginButton: UIButton = {
        let loginButton = UIButton()
        loginButton.setTitle("Sign In", for: .normal)
        loginButton.setTitleColor(UIColor(colorLiteralRed: 251/255, green: 249/255, blue: 243/255, alpha: 1.0), for:.normal)
        loginButton.backgroundColor = UIColor(colorLiteralRed: 238/255, green: 99/255, blue: 131/255, alpha: 1.0)
        loginButton.layer.cornerRadius = 20
        loginButton.layer.borderWidth = 1
        return loginButton
    }()
    
    let registerNavigateButton: UIButton = {
        let registerNavigateButton = UIButton()
        var mainPart = "Don't have an account? Sign up"
        var main = "Don't have an account? "
        var signUp = "Sign up"
        var mainRange = (mainPart as NSString).range(of: main)
        var signUpRange = (mainPart as NSString).range(of: signUp)
        var attributedString = NSMutableAttributedString(string:mainPart)
        attributedString.addAttribute(NSForegroundColorAttributeName, value: UIColor(colorLiteralRed: 251/255, green: 249/255, blue: 243/255, alpha: 1.0) , range: signUpRange)
        attributedString.addAttribute(NSForegroundColorAttributeName, value: UIColor(colorLiteralRed: 172/255, green: 172/255, blue: 172/255, alpha: 1.0) , range: mainRange)
        registerNavigateButton.setAttributedTitle(attributedString, for: .normal)
        registerNavigateButton.backgroundColor = UIColor.clear
        return registerNavigateButton
    }()
    
    override init (frame : CGRect) {
        super.init(frame : frame)
        self.backgroundColor = UIColor.black
        setupLoginView()
        self.backgroundImageView.image = UIImage(named: "hoc.jpg")
        self.backgroundImageView.alpha = 0.5
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLoginView() {
        self.addSubview(backgroundImageView)
        self.addSubview(backButton)
        self.addSubview(logo)
        self.addSubview(usernameField)
        self.addSubview(passwordField)
        self.addSubview(loginButton)
        self.addSubview(registerNavigateButton)
    
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
        
        usernameField.snp.makeConstraints { (make) in
            make.leading.equalTo(30)
            make.trailing.equalTo(-30)
            make.bottom.equalTo(passwordField.snp.top).offset(-15)
            make.height.equalTo(40)
        }
        
        passwordField.snp.makeConstraints { (make) in
            make.leading.equalTo(30)
            make.trailing.equalTo(-30)
            make.bottom.equalTo(loginButton.snp.top).offset(-30)
            make.height.equalTo(40)
        }
        
        loginButton.snp.makeConstraints { (make) in
            make.centerX.equalTo(self)
            make.leading.equalTo(30)
            make.trailing.equalTo(-30)
            make.height.equalTo(50)
            make.bottom.equalTo(registerNavigateButton.snp.top).offset(-30)
        }
        
        registerNavigateButton.snp.makeConstraints { (make) in
            make.bottom.equalTo(self).offset(-20)
            make.centerX.equalTo(self)
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        self.loginButton.layer.shadowColor = UIColor.black.cgColor
        self.loginButton.layer.shadowOpacity = 1
        self.loginButton.layer.shadowOffset = CGSize.zero
        self.loginButton.layer.shadowRadius = 20
        
        self.registerNavigateButton.layer.shadowColor = UIColor.white.cgColor
        self.registerNavigateButton.layer.shadowOpacity = 1
        self.registerNavigateButton.layer.shadowOffset = CGSize.zero
        self.registerNavigateButton.layer.shadowRadius = 5
        
        registerNavigateButton.snp.makeConstraints { (make) in
            make.centerY.equalTo(7 * self.frame.height / 8)
            make.centerX.equalTo(self)
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
        }
    }
}
