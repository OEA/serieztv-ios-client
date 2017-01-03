//
//  GenreTableViewController.swift
//  serieztv
//
//  Created by Goktug on 03/01/2017.
//  Copyright © 2017 serieztv. All rights reserved.
//

import UIKit

class STGenreTableViewController: UITableViewController {

    let backButton: UIButton = {
        let searchButton = UIButton(type: .custom)
        searchButton.setImage(UIImage(named: "icnBack"), for: .normal)
        searchButton.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        return searchButton
    }()
    
    var genre: Genre!
    
    var seriesList = [Series]()
    var movieList = [Movie]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = self.genre.name

        backButton.addTarget(self, action: #selector(self.navigateBack), for: .touchUpInside)
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
        self.tableView.backgroundColor = UIColor(colorLiteralRed: 26/255, green: 26/255, blue: 26/255, alpha: 1.0)
        
        self.tableView.register(STSearchResultTableViewCell.self, forCellReuseIdentifier: "GenreDetailCell")
        
        GenreManager.sharedInstance.getGenreDetail(id: self.genre.id, completion: { (series, movies) in
            self.seriesList = series
            self.movieList = movies
            self.tableView.reloadData()
        }, errorCompletion: nil)

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
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        if section == 0 {
            return seriesList.count
        } else {
            return movieList.count
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Series"
        } else {
            return "Movies"
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GenreDetailCell", for: indexPath) as! STSearchResultTableViewCell
        
        if indexPath.section == 0 {
            cell.titleLabel.text = self.seriesList[indexPath.row].name
            var genres = ""
            for genre in seriesList[indexPath.row].genres! {
                genres += "\(genre.name!) "
            }
            cell.detailLabel.text = genres
            cell.cellImageView.sd_setImage(with: NSURL(string: "http://localhost:3000/images/poster/w92/\(self.seriesList[indexPath.row].id!).jpg")! as URL, placeholderImage:UIImage(named:"placeholder"))
        } else {
            cell.titleLabel.text = self.movieList[indexPath.row].name
            cell.detailLabel.text = "Result details"
            cell.cellImageView.sd_setImage(with: NSURL(string: "http://localhost:3000/images/poster/w92/\(self.movieList[indexPath.row].id!).jpg")! as URL, placeholderImage:UIImage(named:"placeholder"))
            var genres = ""
            for genre in movieList[indexPath.row].genres! {
                genres += "\(genre.name!) "
            }
            cell.detailLabel.text = genres
        }

 

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section ==  0 {
            //series
            let detailViewController = STDetailViewController()
            detailViewController.series = self.seriesList[indexPath.row]
            self.navigationController?.pushViewController(detailViewController, animated: true)
        } else {
            let detailViewController = STDetailViewController()
            detailViewController.movie = self.movieList[indexPath.row]
            self.navigationController?.pushViewController(detailViewController, animated: true)
        }
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
