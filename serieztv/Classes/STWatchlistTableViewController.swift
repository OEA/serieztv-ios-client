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
        tableView.backgroundColor = UIColor(colorLiteralRed: 26/255, green: 26/255, blue: 26/255, alpha: 1.0)
        return tableView
    }()
    
    let searchButton: UIButton = {
        let searchButton = UIButton(type: .custom)
        searchButton.setImage(UIImage(named: "plus"), for: .normal)
        searchButton.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        return searchButton
    }()
    
    let backButton: UIButton = {
        let searchButton = UIButton(type: .custom)
        searchButton.setImage(UIImage(named: "icnBack"), for: .normal)
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
        self.view.backgroundColor = UIColor(colorLiteralRed: 26/255, green: 26/255, blue: 26/255, alpha: 1.0)
        self.tableView.delegate = self
        self.title = "Lists"
        self.tableView.dataSource = self
        self.tableView.register(STWatchlistTableViewCell.self, forCellReuseIdentifier: "watchlistCell")
        self.tableView.snp.makeConstraints { (make) in
            make.leading.trailing.top.bottom.equalTo(0)
        }
        
        backButton.addTarget(self, action: #selector(self.navigateBack), for: .touchUpInside)
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
        
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
    
    func navigateBack() {
        let navController = self.navigationController
        _ = navController?.popViewController(animated: true)
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
                ListManager.sharedInstance.addMovie(list: lists[indexPath.row], movieId: mediaId, completion: { (userlist) in
                    self.tableView.reloadData()
                    let alertController = UIAlertController(title: "Added", message: "The movie is added.", preferredStyle: .alert)
                    let doneAction = UIAlertAction(title: "Done", style: .cancel, handler: { (action) in
                        self.navigateBack()
                    })
                    alertController.addAction(doneAction)
                    self.present(alertController, animated: true, completion: nil)
                }, errorCompletion: nil)
            } else {
                ListManager.sharedInstance.addSeries(list: lists[indexPath.row], seriesId: mediaId, completion: { (userlist) in
                    self.tableView.reloadData()
                    let alertController = UIAlertController(title: "Added", message: "The series is added.", preferredStyle: .alert)
                    let doneAction = UIAlertAction(title: "Done", style: UIAlertActionStyle.cancel, handler: { (action) in
                        self.navigateBack()
                    })
                    alertController.addAction(doneAction)
                    self.present(alertController, animated: true, completion: nil)
                }, errorCompletion: nil)
            }
        } else {
            ListManager.sharedInstance.getAllMedia(list: lists[indexPath.row], completion: { (movies, series) in
                let vc = STWatchlistDetailTableViewController()
                vc.seriesList = series
                vc.movies = movies
                vc.list = self.lists[indexPath.row]
                vc.tableView.reloadData()
                self.navigationController?.pushViewController(vc, animated: true)
            }, errorCompletion: nil)
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }

    
    // Override to support editing the table view.
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            ListManager.sharedInstance.removeList(userlist: lists[indexPath.row], completion: { (userlist) in
                self.lists.remove(at: indexPath.row)
                tableView.reloadData()
            }, errorCompletion: nil)
        }
    }

}
