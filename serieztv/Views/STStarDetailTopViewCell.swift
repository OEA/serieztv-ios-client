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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(colorLiteralRed: 26/255, green: 26/255, blue: 26/255, alpha: 1.0)
        self.addSubview(backgroundImage)
        self.addSubview(topViewTopSeperator)
        self.addSubview(topView)
        self.topView.addSubview(nameLabel)
        self.topView.addSubview(typeLabel)
        self.addSubview(topViewBottomSeperator)
        
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
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
