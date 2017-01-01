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
        topView.backgroundColor = UIColor.lightGray
        return topView
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
        self.addSubview(topView)
        topView.addSubview(usernameLabel)
        topView.addSubview(emailLabel)
        self.addSubview(tableView)
        
        self.topView.snp.makeConstraints { (make) in
            make.top.equalTo(0)
            make.leading.equalTo(0)
            make.trailing.equalTo(0)
        }
        
        self.usernameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(10)
            make.centerX.equalTo(self)
        }
        
        self.emailLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.usernameLabel.snp.bottom).offset(10)
            make.centerX.equalTo(self)
        }
    }
    
    override func layoutSubviews() {
        self.topView.snp.makeConstraints { (make) in
            make.top.equalTo(0)
            make.leading.equalTo(0)
            make.trailing.equalTo(0)
            make.height.equalTo(self.frame.height / 4)
        }
        
        self.tableView.snp.makeConstraints { (make) in
            make.top.equalTo(self.topView.snp.bottom)
            make.leading.equalTo(0)
            make.trailing.equalTo(0)
            make.height.equalTo(3 * self.frame.height / 4)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
