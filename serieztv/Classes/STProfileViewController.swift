//
//  STProfileViewController.swift
//  serieztv
//
//  Created by Goktug on 28/12/2016.
//  Copyright © 2016 serieztv. All rights reserved.
//

import UIKit

class STProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let profileView: STProfileView = {
        let profileView = STProfileView()
        return profileView
    }()
    
    let titles = ["About SeriezTV", "Share SeriezTV", "Give Feedback", "Change Password", "Logout"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(profileView)
        self.profileView.tableView.delegate = self
        self.profileView.tableView.dataSource = self
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.white]
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.topItem?.title = "SeriezTV"
        self.profileView.tableView.register(STProfileTableViewCell.self, forCellReuseIdentifier: "ProfileCell")
        profileView.snp.makeConstraints { (make) in
            make.leading.equalTo(0)
            make.top.equalTo(0)
            make.trailing.equalTo(0)
            make.bottom.equalTo(0)
        }
        
        let userDefaults = UserDefaults.standard
        let username = userDefaults.string(forKey: "username")
        let email = userDefaults.string(forKey: "email")
        self.profileView.emailLabel.text = email
        self.profileView.usernameLabel.text = username
        self.profileView.tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileCell", for: indexPath) as! STProfileTableViewCell
        cell.titleLabel.text = titles[indexPath.row]
        print(titles[indexPath.row])
        cell.selectionStyle = .gray
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (indexPath.row == 0) {
            let aboutVC = STAboutViewController()
            self.navigationController?.pushViewController(aboutVC, animated: true)
        } else if (indexPath.row == 1) {
            
        } else if (indexPath.row == 2) {
            
        } else if (indexPath.row == 3) {
            let changePasswordVC = STChangePasswordViewController()
            self.navigationController?.pushViewController(changePasswordVC, animated: true)
        } else if (indexPath.row == 4) {
            
            let userDefaults = UserDefaults.standard
            userDefaults.removeObject(forKey: "id")
            userDefaults.removeObject(forKey: "name")
            userDefaults.removeObject(forKey: "username")
            userDefaults.removeObject(forKey: "email")
            userDefaults.synchronize()
            self.view.window?.rootViewController = UINavigationController(rootViewController: STMainViewController())
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.profileView.tableView.frame.size.height / 5
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

}


