//
//  STProfileView.swift
//  serieztv
//
//  Created by Goktug on 28/12/2016.
//  Copyright © 2016 serieztv. All rights reserved.
//

import UIKit

class STProfileView: UIView {

    let usernameLabel: UILabel = {
        let usernameLabel = UILabel()
        usernameLabel.text = "Username: username"
        usernameLabel.textColor = UIColor.white
        usernameLabel.textAlignment = NSTextAlignment.center
        usernameLabel.font = UIFont.systemFont(ofSize: 20)
        usernameLabel.adjustsFontSizeToFitWidth = true
        return usernameLabel
    }()
    
    let emailLabel: UILabel = {
        let emailLabel = UILabel()
        emailLabel.text = "Email: email"
        emailLabel.textColor = UIColor.white
        emailLabel.textAlignment = NSTextAlignment.center
        emailLabel.font = UIFont.systemFont(ofSize: 20)
        emailLabel.adjustsFontSizeToFitWidth = true
        return emailLabel
    }()
    
    let changePasswordButton: UIButton = {
        let changePasswordButton = UIButton()
        changePasswordButton.setTitle("Change Password", for: .normal)
        changePasswordButton.setTitleColor(UIColor(colorLiteralRed: 251/255, green: 249/255, blue: 243/255, alpha: 1.0), for:.normal)
        changePasswordButton.backgroundColor = UIColor(colorLiteralRed: 238/255, green: 99/255, blue: 131/255, alpha: 1.0)
        changePasswordButton.layer.cornerRadius = 20
        changePasswordButton.layer.borderWidth = 1
        return changePasswordButton
    }()
    
    let logoutButton: UIButton = {
        let logoutButton = UIButton()
        logoutButton.setTitle("Logout", for: .normal)
        logoutButton.setTitleColor(UIColor(colorLiteralRed: 251/255, green: 249/255, blue: 243/255, alpha: 1.0), for:.normal)
        logoutButton.backgroundColor = UIColor(colorLiteralRed: 238/255, green: 99/255, blue: 131/255, alpha: 1.0)
        logoutButton.layer.cornerRadius = 20
        logoutButton.layer.borderWidth = 1
        return logoutButton
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupProfileView()
    }
    
    func setupProfileView() {
        self.backgroundColor = UIColor.black
        self.addSubview(usernameLabel)
        self.addSubview(emailLabel)
        self.addSubview(changePasswordButton)
        self.addSubview(logoutButton)
        
        self.usernameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(20)
            make.centerX.equalTo(self)
        }
        
        self.emailLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.usernameLabel.snp.bottom).offset(10)
            make.centerX.equalTo(self)
        }
        
        self.changePasswordButton.snp.makeConstraints { (make) in
            make.top.equalTo(self.emailLabel.snp.bottom).offset(20)
            make.leading.equalTo(30)
            make.trailing.equalTo(-30)
            make.height.equalTo(50)
        }
        
        self.logoutButton.snp.makeConstraints { (make) in
            make.top.equalTo(self.changePasswordButton.snp.bottom).offset(20)
            make.leading.equalTo(30)
            make.trailing.equalTo(-30)
            make.height.equalTo(50)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
