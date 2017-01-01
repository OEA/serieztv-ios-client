//
//  HomeTabBarViewController.swift
//  serieztv
//
//  Created by Goktug on 28/12/2016.
//  Copyright © 2016 serieztv. All rights reserved.
//

import UIKit

class STHomeTabBarViewController: UITabBarController {


    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.backgroundColor = UIColor.white
        self.tabBar.isTranslucent = false
        self.tabBar.tintColor = UIColor.black
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let flow = UICollectionViewFlowLayout()
        
        
        let home: STHomeCollectionViewController = STHomeCollectionViewController(collectionViewLayout: flow)
        let profile: STProfileViewController = STProfileViewController()
        
        let homeVC: UINavigationController = UINavigationController(rootViewController: home)
        let profileVC: UINavigationController = UINavigationController(rootViewController: profile)
        
        let icon1 = UITabBarItem(title: "Home", image: UIImage(named: "home"), selectedImage: UIImage(named: "home"))
        
        let icon2 = UITabBarItem(title: "Profile", image: UIImage(named: "user"), selectedImage: UIImage(named: "user"))
        homeVC.tabBarItem = icon1
        profileVC.tabBarItem = icon2
        let controllers = [homeVC, profileVC]
        self.viewControllers = controllers
    }

}
