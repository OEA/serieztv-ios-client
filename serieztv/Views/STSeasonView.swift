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
        tableView.backgroundColor = UIColor(colorLiteralRed: 26/255, green: 26/255, blue: 26/255, alpha: 1.0)
        return tableView
    }()
    
    let posterImageView: UIImageView = {
        let posterImageView = UIImageView()
        posterImageView.image = UIImage(named: "got")
        return posterImageView
    }()
    
    let overviewLabel: UILabel = {
        let overviewLabel = UILabel()
        overviewLabel.text = "overview"
        overviewLabel.font = UIFont.boldSystemFont(ofSize: 14)
        overviewLabel.textColor = UIColor.white
        return overviewLabel
    }()
    
    let numberLabel: UILabel = {
        let numberLabel = UILabel()
        numberLabel.text = "1."
        numberLabel.font = UIFont.boldSystemFont(ofSize: 14)
        numberLabel.textColor = UIColor.white
        return numberLabel
    }()

    let nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.text = "name"
        nameLabel.font = UIFont.boldSystemFont(ofSize: 14)
        nameLabel.textColor = UIColor.white
        return nameLabel
    }()
    
    let topViewTopSeperator: UILabel = {
        let topViewTopSeperator = UILabel()
        topViewTopSeperator.backgroundColor = UIColor.darkGray
        return topViewTopSeperator
    }()
    
    let topView: UIView = {
        let topView = UIView()
        topView.backgroundColor = UIColor.darkGray
        return topView
    }()
    
    let topViewBottomSeperator: UILabel = {
        let topViewBottomSeperator = UILabel()
        topViewBottomSeperator.backgroundColor = UIColor.darkGray
        return topViewBottomSeperator
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(tableView)
        self.backgroundColor = UIColor(colorLiteralRed: 26/255, green: 26/255, blue: 26/255, alpha: 1.0)
        self.addSubview(topView)
        self.topView.addSubview(numberLabel)
        self.addSubview(posterImageView)
        self.topView.addSubview(nameLabel)
        self.topView.addSubview(overviewLabel)
        self.addSubview(topViewTopSeperator)
        self.addSubview(topViewBottomSeperator)
        
        
        self.posterImageView.snp.makeConstraints { (make) in
            make.height.equalTo(200)
            make.top.equalTo(0)
            make.leading.equalTo(0)
            make.trailing.equalTo(0)
        }
        
        self.topViewTopSeperator.snp.makeConstraints { (make) in
            make.height.equalTo(0.25)
            make.leading.equalTo(0)
            make.trailing.equalTo(0)
            make.top.equalTo(self.posterImageView.snp.bottom).offset(0.25)
        }
        
        self.topView.snp.makeConstraints { (make) in
            make.leading.equalTo(0)
            make.trailing.equalTo(0)
            make.top.equalTo(self.topViewTopSeperator.snp.bottom)
            make.height.equalTo(100)
        }
        
        self.numberLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(5)
            make.top.equalTo(10)
        }
        
        self.nameLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(self.numberLabel.snp.trailing).offset(3)
            make.top.equalTo(10)
        }
        
        self.overviewLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(10)
            make.trailing.equalTo(-10)
            make.top.equalTo(nameLabel.snp.bottom).offset(10)
        }
        
        self.topViewBottomSeperator.snp.makeConstraints { (make) in
            make.height.equalTo(0.25)
            make.leading.equalTo(0)
            make.trailing.equalTo(0)
            make.top.equalTo(self.topView.snp.bottom).offset(0.25)
        }

        self.tableView.snp.makeConstraints { (make) in
            make.leading.trailing.bottom.equalTo(0)
            make.top.equalTo(self.topViewBottomSeperator.snp.bottom)
        }
        
    }
    

    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
