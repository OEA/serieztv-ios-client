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
    
    var genreList = [Genre]()
    var seriesList = [Series]()
    var movieList = [Movie]()
    var starList = [Star]()
    
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
            return 0
        } else {
            self.backgroundImageView.alpha = 0
            self.tableView.separatorStyle = .singleLine
            self.tableView.tableFooterView?.isHidden = false
        }
        return 4
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return genreList.count
        } else if section == 1 {
            return seriesList.count
        } else if section == 2 {
            return movieList.count
        } else {
            return starList.count
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Genres"
        } else if section == 1 {
            return "Series"
        } else if section == 2 {
            return "Movies"
        } else {
            return "Stars"
        }
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (isAvailable) {
            
            if indexPath.section == 0 {
                let cell = UITableViewCell()
                cell.backgroundColor = UIColor(colorLiteralRed: 26/255, green: 26/255, blue: 26/255, alpha: 1.0)
                cell.selectionStyle = .none
                cell.textLabel?.textColor = UIColor.white
                cell.textLabel?.text = self.genreList[indexPath.row].name
                return cell
            } else {
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "SearchResultCell", for: indexPath) as! STSearchResultTableViewCell
                
                if indexPath.section == 1 {
                    cell.titleLabel.text = self.seriesList[indexPath.row].name
                    var genres = ""
                    for genre in seriesList[indexPath.row].genres! {
                        genres += "\(genre.name!) "
                    }
                    cell.detailLabel.text = genres
                    cell.cellImageView.sd_setImage(with: NSURL(string: "http://localhost:3000/images/poster/w92/\(self.seriesList[indexPath.row].id!).jpg")! as URL, placeholderImage:UIImage(named:"placeholder"))
                } else if indexPath.section == 2 {
                    cell.titleLabel.text = self.movieList[indexPath.row].name
                    cell.detailLabel.text = "Result details"
                    cell.cellImageView.sd_setImage(with: NSURL(string: "http://localhost:3000/images/poster/w92/\(self.movieList[indexPath.row].id!).jpg")! as URL, placeholderImage:UIImage(named:"placeholder"))
                    var genres = ""
                    for genre in movieList[indexPath.row].genres! {
                        genres += "\(genre.name!) "
                    }
                    cell.detailLabel.text = genres
                } else if indexPath.section == 3 {
                    cell.titleLabel.text = self.starList[indexPath.row].name
                    cell.cellImageView.sd_setImage(with: NSURL(string: "http://localhost:3000/images/backdrop/w300/\(self.starList[indexPath.row].id!).jpg")! as URL, placeholderImage:UIImage(named:"placeholder"))
                    cell.detailLabel.text = ""
                }
                
                return cell
            }
            
        }

        let defaultCell = UITableViewCell()
        defaultCell.backgroundColor = UIColor(colorLiteralRed: 26/255, green: 26/255, blue: 26/255, alpha: 1.0)
        return defaultCell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            //genre detail
            let genreDetailViewController = STGenreTableViewController()
            genreDetailViewController.genre = self.genreList[indexPath.row]
            self.navigationController?.pushViewController(genreDetailViewController, animated: true)
            
        } else if indexPath.section ==  1 {
            //series
            let detailViewController = STDetailViewController()
            detailViewController.series = self.seriesList[indexPath.row]
            self.navigationController?.pushViewController(detailViewController, animated: true)
        } else if indexPath.section == 2 {
            let detailViewController = STDetailViewController()
            detailViewController.movie = self.movieList[indexPath.row]
            self.navigationController?.pushViewController(detailViewController, animated: true)
        } else {
            let detailViewController = STStarDetailViewController()
            self.navigationController?.pushViewController(detailViewController, animated: true)
        }
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        self.isAvailable = false
        self.tableView.reloadData()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.characters.count >= 3 {
            let query = searchText
            SearchManager.sharedInstance.query(query: query, completion: { (genres, movies, series, stars) in
                self.genreList = genres
                self.seriesList = series
                self.movieList = movies
                self.starList = stars
                self.tableView.reloadData()
            }, errorCompletion: nil)
            self.isAvailable = true
        } else {
            self.isAvailable = false
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
