//
//  STFollowDetailTableViewController.swift
//  serieztv
//
//  Created by Goktug on 09/05/2017.
//  Copyright © 2017 serieztv. All rights reserved.
//

import UIKit

class STFollowDetailTableViewController: UITableViewController {
    
    var followers: [User]!
    var following: [User]!
    var isFollowers: Bool!
    
    let backButton: UIButton = {
        let searchButton = UIButton(type: .custom)
        searchButton.setImage(UIImage(named: "icnBack"), for: .normal)
        searchButton.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        return searchButton
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "reuseIdentifier")
        self.view.backgroundColor = UIColor(colorLiteralRed: 26/255, green: 26/255, blue: 26/255, alpha: 1.0)
        self.tableView.tableFooterView = UIView()
        self.tableView.backgroundColor = UIColor(colorLiteralRed: 26/255, green: 26/255, blue: 26/255, alpha: 1.0)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        backButton.addTarget(self, action: #selector(self.navigateBack), for: .touchUpInside)
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func navigateBack() {
        let navController = self.navigationController
        _ = navController?.popViewController(animated: true)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.isFollowers != nil && self.isFollowers == true {
            return followers.count
        }
        return following.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        if self.isFollowers != nil && self.isFollowers == true {
            cell.textLabel?.text = followers[indexPath.row].name
        } else {
            cell.textLabel?.text = following[indexPath.row].name
        }
        cell.backgroundColor = UIColor(colorLiteralRed: 26/255, green: 26/255, blue: 26/255, alpha: 1.0)
        cell.textLabel?.textColor = .white
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detail = STProfileViewController()
        if isFollowers {
            detail.user = followers[indexPath.row]
            detail.isAnotherUser = true
        } else {
            detail.user = following[indexPath.row]
            detail.isAnotherUser = true
        }
        self.navigationController?.pushViewController(detail, animated: true)
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
