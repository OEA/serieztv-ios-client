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
        self.profileView.tableView.register(STProfileTableViewCell.self, forCellReuseIdentifier: "ProfileCell")
        profileView.snp.makeConstraints { (make) in
            make.leading.equalTo(0)
            make.top.equalTo(0)
            make.trailing.equalTo(0)
            make.bottom.equalTo(0)
        }
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
            self.dismiss(animated: true, completion: nil)
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
