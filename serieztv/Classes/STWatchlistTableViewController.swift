//
//  STWatchlistTableViewController.swift
//  serieztv
//
//  Created by Goktug on 27/02/2017.
//  Copyright © 2017 serieztv. All rights reserved.
//

import UIKit

class STWatchlistTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var lists = [Userlist]()
    var user: User!
    var isAdding: Bool = false
    var isMovie: Bool!
    var mediaId: String!
    
    let tableView: UITableView = {
       let tableView = UITableView()
        return tableView
    }()
    
    let searchButton: UIButton = {
        let searchButton = UIButton(type: .custom)
        searchButton.setImage(UIImage(named: "Search"), for: .normal)
        searchButton.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        return searchButton
    }()
    
    let addListView: STAddListView = {
        let addListView = STAddListView()
        return addListView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(tableView)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(STWatchlistTableViewCell.self, forCellReuseIdentifier: "watchlistCell")
        self.tableView.backgroundColor = UIColor.white
        self.tableView.snp.makeConstraints { (make) in
            make.leading.trailing.top.bottom.equalTo(0)
        }
        
        ListManager.sharedInstance.getUserlists(user: user, completion: { (userlists) in
            self.lists = userlists
            self.tableView.reloadData()
        }, errorCompletion: nil)
        
        searchButton.addTarget(self, action: #selector(self.showNewListView), for: .touchUpInside)
        let navigationBarSearchItem = UIBarButtonItem(customView: searchButton)
        self.navigationItem.setRightBarButtonItems([navigationBarSearchItem], animated: true)
        self.view.addSubview(addListView)
        addListView.snp.makeConstraints { (make) in
            make.height.equalTo(250)
            make.width.equalTo(250)
            make.centerX.equalTo(self.view)
            make.centerY.equalTo(self.view)
        }
        
        addListView.alpha = 0.0
        addListView.cancelButton.addTarget(self, action: #selector(self.cancelNewListView), for: .touchUpInside)
        addListView.doneButton.addTarget(self, action: #selector(self.createNewList), for: .touchUpInside)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    func showNewListView() {
        addListView.alpha = 1.0
        tableView.alpha = 0.4
        
    }
    
    func createNewList() {
        ListManager.sharedInstance.createList(userId: user.id, listName: addListView.listNameField.text!, isPrivate: addListView.setStatusButton.isOn, completion: { (userlist) in
            self.lists.append(userlist)
            self.tableView.reloadData()
            self.cancelNewListView()
        }, errorCompletion: nil)
    }
    
    func cancelNewListView() {
        addListView.alpha = 0.0
        tableView.alpha = 1.0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

     func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if lists.count > 0 {
            return lists.count
        }
        return 0
    }

    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "watchlistCell", for: indexPath) as! STWatchlistTableViewCell
        cell.statusLabel.tag = indexPath.row
        cell.setStatusButton.tag = indexPath.row
        cell.setStatusButton.addTarget(self, action: #selector(self.setStatusSwitch(sender:)), for: UIControlEvents.valueChanged)
        cell.titleLabel.text = lists[indexPath.row].name
        if lists[indexPath.row].isPrivate! {
            cell.statusLabel.text = "Private"
            cell.setStatusButton.setOn(false, animated: true)
            print(cell.setStatusButton.isOn)
        } else {
            cell.statusLabel.text = "Public"
            cell.setStatusButton.setOn(true, animated: true)
        }
        return cell
    }
    
    func setStatusSwitch(sender: UISwitch) {
        let index = sender.tag
        var list = lists[index]
        ListManager.sharedInstance.changeListStatus(list: list, newStatus: !list.isPrivate, completion: { (userlist) in
            list = userlist
            self.tableView.reloadData()
        }, errorCompletion: nil)
    }
    
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if isAdding {
            
            if isMovie! {
        //         print(self.lists[indexPath.row].movies.count)
                ListManager.sharedInstance.addMovie(list: lists[indexPath.row], movieId: mediaId, completion: { (userlist) in
                    print(self.lists[indexPath.row].movies.count)
                    self.tableView.reloadData()
                }, errorCompletion: nil)
            } else {
          //       print(self.lists[indexPath.row].seriesList.count)
                ListManager.sharedInstance.addSeries(list: lists[indexPath.row], seriesId: mediaId, completion: { (userlist) in
                     print(self.lists[indexPath.row].seriesList.count)
                    self.tableView.reloadData()
                }, errorCompletion: nil)
            }
        } else {
            ListManager.sharedInstance.getAllMedia(list: lists[indexPath.row], completion: { (movies, series) in
                let vc = STWatchlistDetailTableViewController()
                vc.seriesList = series
                vc.movies = movies
                vc.tableView.reloadData()
                self.navigationController?.pushViewController(vc, animated: true)
            }, errorCompletion: nil)
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
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
