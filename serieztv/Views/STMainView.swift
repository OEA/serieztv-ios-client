//
//  STMainView.swift
//  serieztv
//
//  Created by Goktug on 11/12/2016.
//  Copyright © 2016 serieztv. All rights reserved.
//

import UIKit

class STMainView: UIView {
    
    let backgroundImageView: UIImageView = {
        let backgroundImageView = UIImageView()
        backgroundImageView.contentMode = .scaleToFill
        return backgroundImageView
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
    
    let loginButton: UIButton = {
        let loginButton = UIButton()
        loginButton.setTitle("Sign In", for: .normal)
        loginButton.setTitleColor(UIColor(colorLiteralRed: 251/255, green: 249/255, blue: 243/255, alpha: 1.0), for:.normal)
        loginButton.backgroundColor = UIColor(colorLiteralRed: 238/255, green: 99/255, blue: 131/255, alpha: 1.0)
        loginButton.layer.cornerRadius = 20
        loginButton.layer.borderWidth = 1
        return loginButton
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
    
    let connectionOptionsLabel: UILabel = {
        let connectionOptionsLabel = UILabel()
        connectionOptionsLabel.text = "or connect with.."
        connectionOptionsLabel.textColor = UIColor.white
        connectionOptionsLabel.textAlignment = NSTextAlignment.center
        connectionOptionsLabel.adjustsFontSizeToFitWidth = true
        return connectionOptionsLabel
    }()
    
    let connectWithFacebookButton: UIButton = {
        let connectWithFacebookButton = UIButton()
        connectWithFacebookButton.setTitle("Facebook", for: .normal)
        connectWithFacebookButton.setTitleColor(UIColor.white, for: .normal)
        return connectWithFacebookButton
    }()
    
    let connectWithTwitterButton: UIButton = {
        let connectWithTwitterButton = UIButton()
        connectWithTwitterButton.setTitle("Twitter", for: .normal)
        connectWithTwitterButton.setTitleColor(UIColor.white, for: .normal)
        return connectWithTwitterButton
    }()
    
    let connectWithGoogleButton: UIButton = {
        let connectWithGoogleButton = UIButton()
        connectWithGoogleButton.setTitle("Google+", for: .normal)
        connectWithGoogleButton.setTitleColor(UIColor.white, for: .normal)
        return connectWithGoogleButton
    }()

    override init (frame : CGRect) {
        super.init(frame : frame)
        self.backgroundColor = UIColor.black
        setupMainView()
        self.backgroundImageView.image = UIImage(named: "hoc.jpg")
        self.backgroundImageView.alpha = 0.5
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupMainView() {
        self.addSubview(backgroundImageView)
        self.addSubview(logo)
        self.addSubview(loginButton)
        self.addSubview(registerButton)
        self.addSubview(connectionOptionsLabel)
        self.addSubview(connectWithFacebookButton)
        self.addSubview(connectWithTwitterButton)
        self.addSubview(connectWithGoogleButton)
        
        backgroundImageView.snp.makeConstraints { (make) in
            make.top.equalTo(self.snp.top)
            make.bottom.equalTo(self.snp.bottom)
            make.leading.equalTo(self.snp.leading)
            make.trailing.equalTo(self.snp.trailing)
        }
        
        logo.snp.makeConstraints { (make) in
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
            make.top.equalTo(100)
        }
        
        loginButton.snp.makeConstraints { (make) in
            make.centerY.equalTo(self).offset(50)
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
        }
        
        registerButton.snp.makeConstraints { (make) in
            make.top.equalTo(self.loginButton.snp.bottom).offset(20)
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
        }
        
        connectionOptionsLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.registerButton.snp.bottom).offset(30)
            make.leading.equalTo(50)
            make.height.equalTo(20)
            make.trailing.equalTo(-50)
        }
        
        connectWithFacebookButton.snp.makeConstraints { (make) in
            make.bottom.equalTo(-30)
            make.leading.equalTo(20)
            make.height.equalTo(20)
        }
        
        connectWithTwitterButton.snp.makeConstraints { (make) in
            make.bottom.equalTo(-30)
            make.centerX.equalTo(self)
            make.height.equalTo(20)
        }
        
        connectWithGoogleButton.snp.makeConstraints { (make) in
            make.bottom.equalTo(-30)
            make.trailing.equalTo(-20)
            make.height.equalTo(20)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.loginButton.layer.shadowColor = UIColor.black.cgColor
        self.loginButton.layer.shadowOpacity = 1
        self.loginButton.layer.shadowOffset = CGSize.zero
        self.loginButton.layer.shadowRadius = 20
        
        self.registerButton.layer.shadowColor = UIColor.black.cgColor
        self.registerButton.layer.shadowOpacity = 1
        self.registerButton.layer.shadowOffset = CGSize.zero
        self.registerButton.layer.shadowRadius = 20
        
    }
}
