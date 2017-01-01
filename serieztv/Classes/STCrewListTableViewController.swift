//
//  STCrewListTableViewController.swift
//  serieztv
//
//  Created by Goktug on 01/01/2017.
//  Copyright © 2017 serieztv. All rights reserved.
//

import UIKit

class STCrewListTableViewController: UITableViewController {
    
    let backButton: UIButton = {
        let searchButton = UIButton(type: .custom)
        searchButton.setImage(UIImage(named: "icnBack"), for: .normal)
        searchButton.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        return searchButton
    }()
    
    let items = ["Director", "Writer", "Producer", "Editor", "Casting Director", "Production Designer", "Costume Designer", "Art Director", "Composer", "Production Manager"]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "crewDetailListCell")
        self.tableView.backgroundColor = UIColor(colorLiteralRed: 26/255, green: 26/255, blue: 26/255, alpha: 1.0)
        self.title = "Crew"
        
        self.tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
        self.tableView.separatorColor = UIColor.lightGray
        
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
        return items.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "crewDetailListCell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        cell.backgroundColor = UIColor.clear
        cell.textLabel?.textColor = UIColor.white
        return cell
    }


}
