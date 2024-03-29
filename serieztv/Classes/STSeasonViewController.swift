//
//  STSeasonViewController.swift
//  serieztv
//
//  Created by Goktug on 03/01/2017.
//  Copyright © 2017 serieztv. All rights reserved.
//

import UIKit

class STSeasonViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var seasons = [Season]()
    
    let seasonView: STSeasonView = {
        let seasonView = STSeasonView()
        return seasonView
    }()
    
    let backButton: UIButton = {
        let searchButton = UIButton(type: .custom)
        searchButton.setImage(UIImage(named: "icnBack"), for: .normal)
        searchButton.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        return searchButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(seasonView)
        
        seasonView.snp.makeConstraints { (make) in
            make.leading.trailing.top.bottom.equalTo(0)
        }
        
        self.seasonView.tableView.register(STSeasonTableViewCell.self, forCellReuseIdentifier: "SeasonCell")
        seasonView.tableView.delegate = self
        seasonView.tableView.dataSource = self
        
        backButton.addTarget(self, action: #selector(self.navigateBack), for: .touchUpInside)
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
        // Do any additional setup after loading the view.
        
        self.seasonView.posterImageView.sd_setImage(with: NSURL(string: "http://image.tmdb.org/t/p/w300/\(seasons[0].poster!)")! as URL, placeholderImage:UIImage(named:"got"))
        
    }
    
    func navigateBack() {
        let navController = self.navigationController
        _ = navController?.popViewController(animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SeasonCell", for: indexPath) as! STSeasonTableViewCell
        cell.titleLabel.text = seasons[indexPath.row].name
        cell.numberLabel.text = "\(seasons[indexPath.row].number!)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = STEpisodesViewController()
        vc.episodes = self.seasons[indexPath.row].episodes
        vc.season = self.seasons[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return self.tableView.frame.size.height / 5
//    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.seasons.count
    }

}
