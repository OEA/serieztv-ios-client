//
//  SeasonTableViewCell.swift
//  serieztv
//
//  Created by Goktug on 03/01/2017.
//  Copyright © 2017 serieztv. All rights reserved.
//

import UIKit

class STSeasonView: UIView {
    
    let tableView: UITableView = {
        let tableView: UITableView = UITableView()
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        tableView.backgroundColor = UIColor(colorLiteralRed: 26/255, green: 26/255, blue: 26/255, alpha: 1.0)
        return tableView
    }()
    
    let posterImageView: UIImageView = {
        let posterImageView = UIImageView()
        posterImageView.image = UIImage(named: "got")
        return posterImageView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(tableView)
        self.backgroundColor = UIColor(colorLiteralRed: 26/255, green: 26/255, blue: 26/255, alpha: 1.0)
        self.addSubview(posterImageView)

        self.posterImageView.snp.makeConstraints { (make) in
            make.height.equalTo(200)
            make.top.equalTo(0)
            make.leading.equalTo(0)
            make.trailing.equalTo(0)
        }
        

        self.tableView.snp.makeConstraints { (make) in
            make.leading.trailing.bottom.equalTo(0)
            make.top.equalTo(self.posterImageView.snp.bottom)
        }
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
