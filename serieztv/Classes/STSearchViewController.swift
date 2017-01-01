//
//  STSearchViewController.swift
//  serieztv
//
//  Created by Goktug on 31/12/2016.
//  Copyright © 2016 serieztv. All rights reserved.
//

import UIKit

class STSearchViewController: UITableViewController, UISearchBarDelegate, UISearchResultsUpdating {
    
    let backButton: UIButton = {
        let searchButton = UIButton(type: .custom)
        searchButton.setImage(UIImage(named: "icnBack"), for: .normal)
        searchButton.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        return searchButton
    }()

    let searchController = UISearchController(searchResultsController: nil)
    var backgroundImageView: UIImageView = {
        let backgroundImageView = UIImageView()
        return backgroundImageView
    }()
    var isAvailable: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(colorLiteralRed: 26/255, green: 26/255, blue: 26/255, alpha: 1.0)
        self.tableView.backgroundColor = UIColor(colorLiteralRed: 26/255, green: 26/255, blue: 26/255, alpha: 1.0)
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        searchController.searchBar.showsCancelButton = false
        self.searchController.hidesNavigationBarDuringPresentation = false
        definesPresentationContext = true
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = ""
        searchController.searchBar.tintColor = UIColor.white
        self.navigationItem.titleView = searchController.searchBar
        
        backButton.addTarget(self, action: #selector(self.navigateBack), for: .touchUpInside)
        self.navigationController?.navigationBar.isTranslucent = false
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
        
        self.tableView.register(STSearchResultTableViewCell.self, forCellReuseIdentifier: "SearchResultCell")
        
        self.tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
        self.tableView.separatorColor = UIColor.lightGray
        
        backgroundImageView.image = UIImage(named: "Search")
        
        self.tableView.addSubview(backgroundImageView)
        backgroundImageView.snp.makeConstraints { (make) in
            make.height.equalTo(115)
            make.width.equalTo(130)
            make.centerX.equalTo(self.tableView)
            make.centerY.equalTo(self.tableView)
        }
    }
    
    func navigateBack() {
        let navController = self.navigationController
        _ = navController?.popViewController(animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        if !self.isAvailable {
            self.backgroundImageView.alpha = 0.15
            self.tableView.separatorStyle = .none
            self.tableView.tableFooterView?.isHidden = true
        } else {
            self.backgroundImageView.alpha = 0
            self.tableView.separatorStyle = .singleLine
            self.tableView.tableFooterView?.isHidden = false
        }
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (isAvailable) {
                    let cell = tableView.dequeueReusableCell(withIdentifier: "SearchResultCell", for: indexPath) as! STSearchResultTableViewCell
                    cell.titleLabel.text = "Result name"
                    cell.detailLabel.text = "Result details"
                    cell.cellImageView.image = UIImage(named: "twd")
                    return cell
        }

        let defaultCell = UITableViewCell()
        defaultCell.backgroundColor = UIColor(colorLiteralRed: 26/255, green: 26/255, blue: 26/255, alpha: 1.0)
        return defaultCell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        self.isAvailable = false
        self.tableView.reloadData()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.characters.count > 0 {
            self.isAvailable = true
            self.tableView.reloadData()
        }
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        for subView in searchController.searchBar.subviews
        {
            for subView1 in subView.subviews
            {
                
                if subView1.isKind(of: NSClassFromString("UITextField")!)
                {
                    let textField = subView1 as! UITextField
                    textField.backgroundColor = UIColor.black
                    textField.tintColor = UIColor.white
                    textField.textColor = UIColor.white
                    textField.layer.cornerRadius = 3.0
                    textField.layer.masksToBounds = true
                    textField.layer.borderWidth = 0.5
                    textField.layer.borderColor = UIColor.white.cgColor
                    
                    let imageView = UIImageView(image: UIImage(named: "Search"))
                    imageView.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
                    textField.leftView = imageView
                    textField.leftView?.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
                    textField.clearButtonMode = .whileEditing
                }
            }
            
        }
        
    }
}
