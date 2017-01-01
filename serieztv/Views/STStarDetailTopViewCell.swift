//
//  STStarDetailView.swift
//  serieztv
//
//  Created by Goktug on 27/12/2016.
//  Copyright © 2016 serieztv. All rights reserved.
//

import UIKit

// TOP CELL OF STAR DETAIL COLLECTION VIEW

class STStarDetailTopViewCell: UICollectionViewCell {
    
    let backgroundImage: UIImageView = {
        let backgroundImage = UIImageView()
        return backgroundImage
    }()
    
    
    let topViewTopSeperator: UILabel = {
        let imageViewSeperator = UILabel()
        imageViewSeperator.backgroundColor = UIColor.darkGray
        return imageViewSeperator
    }()
    
    let topView: UIView = {
        let topView = UIView()
        topView.backgroundColor = UIColor.darkGray
        return topView
    }()
    
    let nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.text = "Star Name"
        nameLabel.textColor = UIColor.white
        nameLabel.font = UIFont.boldSystemFont(ofSize: 20)
        nameLabel.adjustsFontSizeToFitWidth = true
        return nameLabel
    }()
    
    let typeLabel: UILabel = {
        let typeLabel = UILabel()
        typeLabel.text = "Actor"
        typeLabel.textColor = UIColor.lightGray
        typeLabel.font = UIFont.systemFont(ofSize: 12)
        typeLabel.adjustsFontSizeToFitWidth = true
        return typeLabel
    }()
    
    let topViewBottomSeperator: UILabel = {
        let imageViewSeperator = UILabel()
        imageViewSeperator.backgroundColor = UIColor.darkGray
        return imageViewSeperator
    }()
    
    let detailImageView: UIImageView = {
        let detailImageView = UIImageView()
        detailImageView.image = UIImage(named: "twd")
        return detailImageView
    }()
    
    let imageViewSeperator: UILabel = {
        let imageViewSeperator = UILabel()
        imageViewSeperator.backgroundColor = UIColor.darkGray
        return imageViewSeperator
    }()
    
    let overviewText: UILabel = {
        let overviewText = UILabel()
        overviewText.text = "Overview of the detail"
        overviewText.numberOfLines = 0
        overviewText.textColor = UIColor.white
        overviewText.font = UIFont.systemFont(ofSize: 14)
        return overviewText
    }()
    
    let overviewSeperator: UILabel = {
        let overviewSeperator = UILabel()
        overviewSeperator.backgroundColor = UIColor.darkGray
        return overviewSeperator
    }()

    
    let bornLabel: UILabel = {
        let bornLabel = UILabel()
        bornLabel.text = "Born"
        bornLabel.textColor = UIColor.white
        bornLabel.font = UIFont.systemFont(ofSize: 12)
        bornLabel.adjustsFontSizeToFitWidth = true
        return bornLabel
    }()
    
    let birthdayLabel: UILabel = {
        let birthdayLabel = UILabel()
        birthdayLabel.text = "11 Month, Year"
        birthdayLabel.textColor = UIColor.darkGray
        birthdayLabel.font = UIFont.systemFont(ofSize: 11)
        birthdayLabel.adjustsFontSizeToFitWidth = true
        return birthdayLabel
    }()
    
    let ageLabel: UILabel = {
        let ageLabel = UILabel()
        ageLabel.text = "(age xx)"
        ageLabel.textColor = UIColor.lightGray
        ageLabel.font = UIFont.systemFont(ofSize: 11)
        ageLabel.adjustsFontSizeToFitWidth = true
        return ageLabel
    }()
    
    let bottomSeperator: UILabel = {
        let imageViewSeperator = UILabel()
        imageViewSeperator.backgroundColor = UIColor.darkGray
        return imageViewSeperator
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(colorLiteralRed: 26/255, green: 26/255, blue: 26/255, alpha: 1.0)
        self.addSubview(backgroundImage)
        self.addSubview(topViewTopSeperator)
        self.addSubview(topView)
        self.topView.addSubview(nameLabel)
        self.topView.addSubview(typeLabel)
        self.addSubview(topViewBottomSeperator)
        self.addSubview(detailImageView)
        self.addSubview(imageViewSeperator)
        self.addSubview(overviewText)
        self.addSubview(overviewSeperator)
        self.addSubview(bornLabel)
        self.addSubview(birthdayLabel)
        self.addSubview(ageLabel)
        self.addSubview(bottomSeperator)
        
        self.backgroundImage.snp.makeConstraints { (make) in
            make.height.equalTo(200)
            make.top.equalTo(0)
            make.leading.equalTo(0)
            make.trailing.equalTo(0)
        }
        
        self.topViewTopSeperator.snp.makeConstraints { (make) in
            make.height.equalTo(0.25)
            make.leading.equalTo(0)
            make.trailing.equalTo(0)
            make.top.equalTo(self.backgroundImage.snp.bottom).offset(0.25)
        }
        
        self.topView.snp.makeConstraints { (make) in
            make.leading.equalTo(0)
            make.trailing.equalTo(0)
            make.top.equalTo(self.topViewTopSeperator.snp.bottom)
            make.height.equalTo(55)
        }
        
        self.nameLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(20)
            make.top.equalTo(5)
        }
        
        self.typeLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.nameLabel.snp.bottom).offset(3)
            make.leading.equalTo(self.nameLabel.snp.leading)
        }
        
        self.topViewBottomSeperator.snp.makeConstraints { (make) in
            make.height.equalTo(0.25)
            make.leading.equalTo(0)
            make.trailing.equalTo(0)
            make.top.equalTo(self.topView.snp.bottom).offset(0.25)
        }
        
        self.detailImageView.snp.makeConstraints { (make) in
            make.leading.equalTo(10)
            make.top.equalTo(topViewBottomSeperator.snp.bottom).offset(10)
            make.height.equalTo(100)
            make.width.equalTo(70)
        }
        
        self.imageViewSeperator.snp.makeConstraints { (make) in
            make.height.equalTo(0.25)
            make.leading.equalTo(0)
            make.trailing.equalTo(0)
            make.top.equalTo(self.detailImageView.snp.bottom).offset(6)
        }
        
        self.overviewText.snp.makeConstraints { (make) in
            make.leading.equalTo(self.detailImageView.snp.trailing).offset(10)
            make.trailing.equalTo(-10)
            make.top.equalTo(self.detailImageView.snp.top).offset(10)
        }
        
        self.overviewSeperator.snp.makeConstraints { (make) in
            make.height.equalTo(0.25)
            make.leading.equalTo(self.detailImageView.snp.trailing).offset(10)
            make.trailing.equalTo(0)
            make.top.equalTo(self.overviewText.snp.bottom).offset(15)
        }
        
        self.bornLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(detailImageView.snp.trailing).offset(3)
            make.top.equalTo(imageViewSeperator.snp.bottom).offset(8)
        }
        
        self.birthdayLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(bornLabel.snp.trailing).offset(1)
            make.top.equalTo(imageViewSeperator.snp.bottom).offset(8)
        }
        
        self.ageLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(birthdayLabel.snp.trailing).offset(1)
            make.bottom.equalTo(birthdayLabel.snp.bottom)
        }
        
        self.bottomSeperator.snp.makeConstraints { (make) in
            make.height.equalTo(0.5)
            make.leading.equalTo(0)
            make.trailing.equalTo(0)
            make.bottom.equalTo(-0.5)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
