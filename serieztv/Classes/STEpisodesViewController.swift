//
//  EpisodesTableViewController.swift
//  serieztv
//
//  Created by Goktug on 03/01/2017.
//  Copyright © 2017 serieztv. All rights reserved.
//

import UIKit

class STEpisodesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var episodes = ["Episode 1", "Episode 2", "Episode 3", "Episode 4", "Episode 5", "Episode 6", "Episode 7", "Episode 8"]
    
    let episodesView: STEpisodesView = {
        let episodesView = STEpisodesView()
        return episodesView
    }()
    
    let backButton: UIButton = {
        let searchButton = UIButton(type: .custom)
        searchButton.setImage(UIImage(named: "icnBack"), for: .normal)
        searchButton.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        return searchButton
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Season X"
        self.view.addSubview(episodesView)
        
        episodesView.snp.makeConstraints { (make) in
            make.leading.trailing.top.bottom.equalTo(0)
        }
        self.episodesView.tableView.register(STEpisodeTableViewCell.self, forCellReuseIdentifier: "episodeCell")
        episodesView.tableView.delegate = self
        episodesView.tableView.dataSource = self
        
        backButton.addTarget(self, action: #selector(self.navigateBack), for: .touchUpInside)
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)

    }
    
    func navigateBack() {
        let navController = self.navigationController
        _ = navController?.popViewController(animated: true)
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
        // #warning Incomplete implementation, return the number of rows
        return episodes.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "episodeCell", for: indexPath) as! STEpisodeTableViewCell
        
        cell.numberLabel.text = "\(indexPath.row+1)"
        cell.nameLabel.text = episodes[indexPath.row]

        return cell
    }

}
