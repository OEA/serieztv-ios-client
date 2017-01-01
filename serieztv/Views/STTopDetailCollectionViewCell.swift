//
//  STTopDetailCollectionViewCell.swift
//  serieztv
//
//  Created by Goktug on 31/12/2016.
//  Copyright © 2016 serieztv. All rights reserved.
//

import UIKit

// TOP CELL OF MOVIE-SERIES DETAIL

class STTopDetailCollectionViewCell: UICollectionViewCell {
    
    let posterImageView: UIImageView = {
        let posterImageView = UIImageView()
        return posterImageView
    }()
    
    let topView: UIView = {
        let topView = UIView()
        topView.backgroundColor = UIColor.darkGray
        return topView
    }()
    
    let nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.text = "Name"
        nameLabel.textColor = UIColor.white
        nameLabel.font = UIFont.boldSystemFont(ofSize: 20)
        nameLabel.adjustsFontSizeToFitWidth = true
        return nameLabel
    }()
    
    let yearLabel: UILabel = {
        let yearLabel = UILabel()
        yearLabel.text = "Year"
        yearLabel.textColor = UIColor.lightGray
        yearLabel.font = UIFont.systemFont(ofSize: 14)
        yearLabel.adjustsFontSizeToFitWidth = true
        return yearLabel
    }()
    
    let typeLabel: UILabel = {
        let typeLabel = UILabel()
        typeLabel.text = "TV Series"
        typeLabel.textColor = UIColor.lightGray
        typeLabel.font = UIFont.systemFont(ofSize: 12)
        typeLabel.adjustsFontSizeToFitWidth = true
        return typeLabel
    }()
    
    let timeLabel: UILabel = {
        let timeLabel = UILabel()
        timeLabel.text = "| x min"
        timeLabel.textColor = UIColor.lightGray
        timeLabel.font = UIFont.systemFont(ofSize: 12)
        timeLabel.adjustsFontSizeToFitWidth = true
        return timeLabel
    }()
    
    let genresLabel: UILabel = {
        let genresLabel = UILabel()
        genresLabel.text = "| Genres"
        genresLabel.textColor = UIColor.lightGray
        genresLabel.font = UIFont.systemFont(ofSize: 12)
        genresLabel.adjustsFontSizeToFitWidth = true
        return genresLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.black
        self.setupDetailView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupDetailView() {
        self.addSubview(posterImageView)
        self.addSubview(topView)
        self.topView.addSubview(nameLabel)
        self.topView.addSubview(yearLabel)
        self.topView.addSubview(typeLabel)
        self.topView.addSubview(timeLabel)
        self.topView.addSubview(genresLabel)
        
        self.posterImageView.snp.makeConstraints { (make) in
            make.height.equalTo(200)
            make.top.equalTo(0)
            make.leading.equalTo(0)
            make.trailing.equalTo(0)
        }
        
        self.topView.snp.makeConstraints { (make) in
            make.leading.equalTo(0)
            make.trailing.equalTo(0)
            make.top.equalTo(self.posterImageView.snp.bottom)
            make.height.equalTo(55)
        }
        
        self.nameLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(20)
            make.top.equalTo(5)
        }
        
        self.yearLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(self.nameLabel.snp.trailing).offset(3)
            make.bottom.equalTo(self.nameLabel.snp.bottom)
        }
        
        self.typeLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.nameLabel.snp.bottom).offset(3)
            make.leading.equalTo(self.nameLabel.snp.leading)
        }
        
        self.timeLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(self.typeLabel.snp.trailing).offset(3)
            make.bottom.equalTo(self.typeLabel.snp.bottom)
        }
        
        self.genresLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(self.timeLabel.snp.trailing).offset(3)
            make.bottom.equalTo(self.timeLabel.snp.bottom)
        }
    }
}
