//
//  STProfileView.swift
//  serieztv
//
//  Created by Goktug on 28/12/2016.
//  Copyright © 2016 serieztv. All rights reserved.
//

import UIKit

class STProfileView: UIView {
    
    let topView: UIView = {
        let topView = UIView(frame: CGRect.zero)
        topView.backgroundColor = UIColor(colorLiteralRed: 26/255, green: 26/255, blue: 26/255, alpha: 1.0)
        return topView
    }()
    
    let userCircleView: UIView = {
        let userCircleView = UIView()
        userCircleView.layer.cornerRadius = 30
        userCircleView.backgroundColor = .white
        userCircleView.layer.masksToBounds = true
        return userCircleView
    }()
    
    let userInitialLabel: UILabel = {
        let userInitialLabel = UILabel()
        userInitialLabel.textColor = .white
        userInitialLabel.font = UIFont.boldSystemFont(ofSize: 30)
        return userInitialLabel
    }()
    
    let followersButton: UIButton = {
        let followersButton = UIButton(type: UIButtonType.roundedRect)
        followersButton.setTitle("Followers", for: .normal)
        followersButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        followersButton.setTitleColor(UIColor.white, for: .normal)
        return followersButton
    }()
    
    let followingButton: UIButton = {
        let followingButton = UIButton(type: UIButtonType.roundedRect)
        followingButton.setTitle("Following", for: .normal)
        followingButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        followingButton.setTitleColor(UIColor.white, for: .normal)
        return followingButton
    }()
    
    let tableView: UITableView = {
        let tableView: UITableView = UITableView()
        return tableView
    }()

    let usernameLabel: UILabel = {
        let usernameLabel = UILabel()
        usernameLabel.text = "username"
        usernameLabel.textColor = UIColor.white
        usernameLabel.textAlignment = NSTextAlignment.center
        usernameLabel.font = UIFont.systemFont(ofSize: 20)
        usernameLabel.adjustsFontSizeToFitWidth = true
        return usernameLabel
    }()
    
    let emailLabel: UILabel = {
        let emailLabel = UILabel()
        emailLabel.text = "email"
        emailLabel.textColor = UIColor.white
        emailLabel.textAlignment = NSTextAlignment.center
        emailLabel.font = UIFont.systemFont(ofSize: 18)
        emailLabel.adjustsFontSizeToFitWidth = true
        return emailLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupProfileView()
    }
    
    func setupProfileView() {
        self.backgroundColor = UIColor.white
        addSubview(topView)
        topView.addSubview(userCircleView)
        userCircleView.addSubview(userInitialLabel)
        topView.addSubview(usernameLabel)
        topView.addSubview(emailLabel)
        topView.addSubview(followersButton)
        topView.addSubview(followingButton)
        self.addSubview(tableView)
        
        self.topView.snp.makeConstraints { (make) in
            make.top.equalTo(0)
            make.leading.equalTo(0)
            make.trailing.equalTo(0)
        }
        
        userCircleView.snp.makeConstraints { (make) in
            make.height.width.equalTo(60)
            make.centerX.equalTo(topView)
            make.top.equalTo(20)
        }
        
        userInitialLabel.snp.makeConstraints { (make) in
            make.center.equalTo(userCircleView)
        }
        
        self.usernameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(userCircleView.snp.bottom).offset(10)
            make.centerX.equalTo(userCircleView)
        }
        
        self.emailLabel.snp.makeConstraints { (make) in
            make.top.equalTo(usernameLabel.snp.bottom).offset(3)
            make.centerX.equalTo(userCircleView)
        }
        
        followersButton.snp.makeConstraints { (make) in
            make.top.equalTo(emailLabel.snp.bottom).offset(10)
            make.trailing.equalTo(userCircleView.snp.centerX).offset(-20)
        }
        
        followingButton.snp.makeConstraints { (make) in
            make.top.equalTo(emailLabel.snp.bottom).offset(10)
            make.leading.equalTo(userCircleView.snp.centerX).offset(20)
        }
    }
    
    override func layoutSubviews() {
        self.topView.snp.makeConstraints { (make) in
            make.top.equalTo(0)
            make.leading.equalTo(0)
            make.trailing.equalTo(0)
            make.height.equalTo(2*self.frame.height/5)
        }
        
        self.tableView.snp.makeConstraints { (make) in
            make.top.equalTo(self.topView.snp.bottom)
            make.leading.equalTo(0)
            make.trailing.equalTo(0)
            make.height.equalTo(3*self.frame.height / 5)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
