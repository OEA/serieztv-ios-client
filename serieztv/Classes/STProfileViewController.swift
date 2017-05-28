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
    
    let backButton: UIButton = {
        let searchButton = UIButton(type: .custom)
        searchButton.setImage(UIImage(named: "icnBack"), for: .normal)
        searchButton.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        return searchButton
    }()
    
    var isAnotherUser = false
    let colorArray = [UIColor.red, UIColor.blue, UIColor.green, UIColor.brown, UIColor.yellow, UIColor.orange]
   // let titles = ["About SeriezTV", "Watchlists", "Give Feedback", "Change Password", "Logout"]
    let titles = ["About SeriezTV", "Watchlists", "Followed Movies", "Followed Series", "Change Password", "Logout"]
    var user: User = User()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(profileView)
        self.profileView.tableView.delegate = self
        self.profileView.tableView.dataSource = self

        profileView.followersButton.addTarget(self, action: #selector(navigateToFollowers), for: .touchUpInside)
        profileView.followingButton.addTarget(self, action: #selector(navigateToFollowing), for: .touchUpInside)
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
        if !isAnotherUser {
            user.username = userDefaults.string(forKey: "username")
            user.id = userDefaults.string(forKey: "id")
            user.email = userDefaults.string(forKey: "email")
        } else {
            backButton.addTarget(self, action: #selector(self.navigateBack), for: .touchUpInside)
            self.navigationController?.navigationBar.isTranslucent = false
            self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
        }

        self.profileView.emailLabel.text = user.email
        self.profileView.usernameLabel.text = user.username
        self.profileView.tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
        profileView.userInitialLabel.text = "\(user.username.uppercased()[user.username.startIndex])"
        let random: Int = Int(arc4random_uniform(UInt32(colorArray.count)))
        profileView.userCircleView.backgroundColor = colorArray[random]
        
        AuthManager.sharedInstance.getFollowers(userId: user.id, completion: { (users) in
            self.user.followers = users
            self.profileView.followersButton.setTitle("\(self.user.followers.count) Followers", for: .normal)
        }, errorCompletion: nil)
        
        AuthManager.sharedInstance.getFollowing(userId: user.id, completion: { (users) in
            self.user.following = users
            self.profileView.followingButton.setTitle("\(self.user.following.count) Following", for: .normal)
        }, errorCompletion: nil)
        
        
//
//
        // Do any additional setup after loading the view.
    }
    
    func navigateBack() {
        let navController = self.navigationController
        _ = navController?.popViewController(animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func navigateToFollowers() {
        let followVC = STFollowDetailTableViewController()
        followVC.following = user.following
        followVC.followers = user.followers
        followVC.isFollowers = true
        navigationController?.pushViewController(followVC, animated: true)
    }
    
    func navigateToFollowing() {
        let followVC = STFollowDetailTableViewController()
        followVC.following = user.following
        followVC.followers = user.followers
        followVC.isFollowers = false
        navigationController?.pushViewController(followVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileCell", for: indexPath) as! STProfileTableViewCell
        cell.titleLabel.text = titles[indexPath.row]
        if indexPath.row == 0 {
            cell.cellImageView.image = UIImage(named: "about")
        } else if indexPath.row == 1 {
            cell.cellImageView.image = UIImage(named: "list")
        } else if indexPath.row == 2 {
            cell.cellImageView.image = UIImage(named: "movieslist")
        } else if indexPath.row == 3 {
            cell.cellImageView.image = UIImage(named: "serieslist")
        } else if indexPath.row == 4 {
            cell.cellImageView.image = UIImage(named: "changepassword")
        } else if indexPath.row == 5 {
            cell.cellImageView.image = UIImage(named: "logou")
        }
        cell.selectionStyle = .gray
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (indexPath.row == 0) {
            let aboutVC = STAboutViewController()
            self.navigationController?.pushViewController(aboutVC, animated: true)
        } else if (indexPath.row == 1) {
            let watchlistVC = STWatchlistTableViewController()
            watchlistVC.user = self.user
            self.navigationController?.pushViewController(watchlistVC, animated: true)
        } else if (indexPath.row == 2) {
            let followedVC = STFollowedMediaTableViewController()
            followedVC.user = self.user
            followedVC.isMovie = true
            self.navigationController?.pushViewController(followedVC, animated: true)
        } else if (indexPath.row == 3) {
            let followedVC = STFollowedMediaTableViewController()
            followedVC.user = self.user
            followedVC.isMovie = false
            self.navigationController?.pushViewController(followedVC, animated: true)
        } else if (indexPath.row == 4) {
            let changePasswordVC = STChangePasswordViewController()
            self.navigationController?.pushViewController(changePasswordVC, animated: true)
        } else if (indexPath.row == 5) {
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
        return self.profileView.tableView.frame.size.height / CGFloat(titles.count)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }

}


