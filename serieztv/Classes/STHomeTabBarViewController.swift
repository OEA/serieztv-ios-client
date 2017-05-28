//
//  HomeTabBarViewController.swift
//  serieztv
//
//  Created by Goktug on 28/12/2016.
//  Copyright © 2016 serieztv. All rights reserved.
//

import UIKit

class STHomeTabBarViewController: UITabBarController {

    var movies = [Movie]()
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
        
    //    let newsfeed = FeedCollectionViewController(collectionViewLayout: flow)
        let home: STHomeCollectionViewController = STHomeCollectionViewController(collectionViewLayout: flow)
        let profile: STProfileViewController = STProfileViewController()
        let calendar = STCalendarViewController()
        home.movies = self.movies
        //   let newsfeedVC: UINavigationController = UINavigationController(rootViewController: newsfeed)
        let homeVC: UINavigationController = UINavigationController(rootViewController: home)
        let profileVC: UINavigationController = UINavigationController(rootViewController: profile)
        let calendarVC: UINavigationController = UINavigationController(rootViewController: calendar)
       // let icon1 = UITabBarItem(title: "", image: UIImage(named: "feed"), selectedImage: UIImage(named: "feed"))
        let icon2 = UITabBarItem(title: "", image: UIImage(named: "home"), selectedImage: UIImage(named: "home"))
        let icon3 = UITabBarItem(title: "", image: UIImage(named: "calendar"), selectedImage: UIImage(named: "calendar"))
        let icon4 = UITabBarItem(title: nil, image: UIImage(named: "user"), selectedImage: UIImage(named: "user"))
        homeVC.tabBarItem = icon2
      //  newsfeedVC.tabBarItem = icon1
        calendarVC.tabBarItem = icon3
        profileVC.tabBarItem = icon4
        let controllers = [homeVC, calendarVC, profileVC]
        self.viewControllers = controllers
    }

}
