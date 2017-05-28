//
//  STFollowedMediaTableViewController.swift
//  serieztv
//
//  Created by Goktug on 29/05/2017.
//  Copyright © 2017 serieztv. All rights reserved.
//

import UIKit

class STFollowedMediaTableViewController: UITableViewController {
    
    var movies = [Movie]()
    var series = [Series]()
    var user: User!
    
    var isMovie: Bool!
    
    let backButton: UIButton = {
        let searchButton = UIButton(type: .custom)
        searchButton.setImage(UIImage(named: "icnBack"), for: .normal)
        searchButton.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        return searchButton
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
         self.tableView.register(STSearchResultTableViewCell.self, forCellReuseIdentifier: "followedDetailCell")
        self.view.backgroundColor = UIColor(colorLiteralRed: 26/255, green: 26/255, blue: 26/255, alpha: 1.0)
        self.tableView.tableFooterView = UIView()
        self.tableView.backgroundColor = UIColor(colorLiteralRed: 26/255, green: 26/255, blue: 26/255, alpha: 1.0)
         AuthManager.sharedInstance.getMovies(userId: user.id, completion: { (movies) in
            self.movies = movies
            self.tableView.reloadData()
         }, errorCompletion: nil)
        
        AuthManager.sharedInstance.getSeries(userId: user.id, completion: { (series) in
            self.series = series
            self.tableView.reloadData()
        }, errorCompletion: nil)
        
        backButton.addTarget(self, action: #selector(self.navigateBack), for: .touchUpInside)
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
        
        if isMovie {
            self.title = "Followed Movies"
        } else {
            self.title = "Followed Series"
        }
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
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
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if isMovie && movies.count > 0 {
            return movies.count
        } else if !isMovie && series.count > 0 {
            return series.count
        }
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "followedDetailCell", for: indexPath) as! STSearchResultTableViewCell
        if isMovie {
            cell.titleLabel.text = movies[indexPath.row].name
            cell.cellImageView.sd_setImage(with: NSURL(string: "http://localhost:3000/images/poster/w92/\(self.movies[indexPath.row].id!).jpg")! as URL, placeholderImage:UIImage(named:"placeholder"))
            cell.detailLabel.text = movies[indexPath.row].genres[0].name
            
        } else {
            cell.titleLabel.text = series[indexPath.row].name
            cell.cellImageView.sd_setImage(with: NSURL(string: "http://localhost:3000/images/poster/w92/\(self.series[indexPath.row].id!).jpg")! as URL, placeholderImage:UIImage(named:"placeholder"))
            cell.detailLabel.text = series[indexPath.row].genres[0].name
            
        }
        
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailViewController = STDetailViewController()
        
        if isMovie {
            detailViewController.movie = self.movies[indexPath.row]
            self.navigationController?.pushViewController(detailViewController, animated: true)
        } else {
            detailViewController.series = self.series[indexPath.row]
            self.navigationController?.pushViewController(detailViewController, animated: true)
        }
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

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
