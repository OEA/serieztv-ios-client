//
//  STWatchlistDetailTableViewController.swift
//  serieztv
//
//  Created by Goktug on 21/03/2017.
//  Copyright © 2017 serieztv. All rights reserved.
//

import UIKit

class STWatchlistDetailTableViewController: UITableViewController {
    
    var seriesList =  [Series]() {
        didSet {
            tableView.reloadData()
        }
    }
    var movies = [Movie]() {
        didSet {
            tableView.reloadData()
        }
    }

    var list: Userlist! {
        didSet {
            self.title = list.name
        }
    }
    
    let backButton: UIButton = {
        let searchButton = UIButton(type: .custom)
        searchButton.setImage(UIImage(named: "icnBack"), for: .normal)
        searchButton.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        return searchButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(colorLiteralRed: 26/255, green: 26/255, blue: 26/255, alpha: 1.0)
        self.tableView.backgroundColor = UIColor(colorLiteralRed: 26/255, green: 26/255, blue: 26/255, alpha: 1.0)
        self.tableView.register(STSearchResultTableViewCell.self, forCellReuseIdentifier: "watchlistDetailCell")
        backButton.addTarget(self, action: #selector(self.navigateBack), for: .touchUpInside)
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
        self.tableView.tableFooterView = UIView()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment var following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if section == 0 {
            return movies.count
        } else {
            return seriesList.count
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Movies"
        } else {
            return "Series"
        }
    }
    
    func navigateBack() {
        let navController = self.navigationController
        _ = navController?.popViewController(animated: true)
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "watchlistDetailCell", for: indexPath) as! STSearchResultTableViewCell
        if indexPath.section == 0 {
            cell.titleLabel.text = movies[indexPath.row].name
            cell.cellImageView.sd_setImage(with: NSURL(string: "http://localhost:3000/images/poster/w92/\(self.movies[indexPath.row].id!).jpg")! as URL, placeholderImage:UIImage(named:"placeholder"))
            cell.detailLabel.text = movies[indexPath.row].genres[0].name
            
        } else {
            cell.titleLabel.text = seriesList[indexPath.row].name
            cell.cellImageView.sd_setImage(with: NSURL(string: "http://localhost:3000/images/poster/w92/\(self.seriesList[indexPath.row].id!).jpg")! as URL, placeholderImage:UIImage(named:"placeholder"))
            cell.detailLabel.text = seriesList[indexPath.row].genres[0].name
            
        }

        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            if indexPath.section == 0 {
                ListManager.sharedInstance.removeMovie(list: list, movieId: movies[indexPath.row].id, completion: { (userlist) in
                    self.list = userlist
                    self.movies = userlist.movies
                    tableView.reloadData()
                }, errorCompletion: nil)
            } else {
                ListManager.sharedInstance.removeSeries(list: list, seriesId: seriesList[indexPath.row].id, completion: { (userlist) in
                    self.list = userlist
                    self.seriesList = userlist.seriesList
                    tableView.reloadData()
                }, errorCompletion: nil)
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailViewController = STDetailViewController()
        
        if indexPath.section == 0 {
            detailViewController.movie = self.movies[indexPath.row]
            self.navigationController?.pushViewController(detailViewController, animated: true)
        } else {
            detailViewController.series = self.seriesList[indexPath.row]
            self.navigationController?.pushViewController(detailViewController, animated: true)
        }
    }
    

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
