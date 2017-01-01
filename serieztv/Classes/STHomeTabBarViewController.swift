//
//  HomeTabBarViewController.swift
//  serieztv
//
//  Created by Goktug on 28/12/2016.
//  Copyright © 2016 serieztv. All rights reserved.
//

import UIKit

class STHomeTabBarViewController: UITabBarController {
    
    let searchButton: UIButton = {
        let searchButton = UIButton(type: .custom)
        searchButton.setImage(UIImage(named: "Search"), for: .normal)
        searchButton.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        return searchButton
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        searchButton.addTarget(self, action: #selector(self.search), for: .touchUpInside)
        self.tabBar.backgroundColor = UIColor.white
        self.tabBar.isTranslucent = false
        self.tabBar.tintColor = UIColor.black
        let navigationBarSearchItem = UIBarButtonItem(customView: searchButton)
        
        
        self.navigationItem.setRightBarButtonItems([navigationBarSearchItem], animated: true)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func search() {
        let searchVC = STSearchViewController()
        self.navigationController?.pushViewController(searchVC, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let flow = UICollectionViewFlowLayout()
        let home: STHomeCollectionViewController = STHomeCollectionViewController(collectionViewLayout: flow)
        let profile: STProfileViewController = STProfileViewController()
        
        let icon1 = UITabBarItem(title: "Home", image: UIImage(named: "home"), selectedImage: UIImage(named: "home"))
        
        let icon2 = UITabBarItem(title: "Profile", image: UIImage(named: "user"), selectedImage: UIImage(named: "user"))
        home.tabBarItem = icon1
        profile.tabBarItem = icon2
        let controllers = [home, profile]  //array of the root view controllers displayed by the tab bar interface
        self.viewControllers = controllers
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
