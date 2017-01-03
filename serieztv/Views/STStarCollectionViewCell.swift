//
//  STStarCollectionViewCell.swift
//  serieztv
//
//  Created by Goktug on 30/12/2016.
//  Copyright © 2016 serieztv. All rights reserved.
//

import UIKit

// CELLS OF STARS

class STStarCollectionViewCell: UICollectionViewCell {
    
    let starImageView: UIImageView = {
        let starImageView = UIImageView()
        starImageView.layer.cornerRadius = 5
        starImageView.layer.masksToBounds = true
        return starImageView
    }()
    
    let nameLabel: UILabel = {
        let name = UILabel()
        name.text = "Star"
        name.textColor = UIColor.white
        name.textAlignment = NSTextAlignment.center
        name.lineBreakMode = .byTruncatingTail
        name.font = UIFont.boldSystemFont(ofSize: 12)
        return name
    }()
    
    let characterLabel: UILabel = {
        let name = UILabel()
        name.textColor = UIColor.lightGray
        name.textAlignment = NSTextAlignment.center
        name.font = UIFont.boldSystemFont(ofSize: 10)
        name.lineBreakMode = .byTruncatingTail
        return name
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(starImageView)
        self.addSubview(nameLabel)
        self.addSubview(characterLabel)
        
        self.starImageView.snp.makeConstraints { (make) in
            make.leading.equalTo(10)
            make.trailing.equalTo(-10)
            make.height.equalTo(100)
            make.top.equalTo(10)
        }
        
        self.nameLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(self)
            make.top.equalTo(self.starImageView.snp.bottom).offset(6)
            make.leading.trailing.equalTo(0)
        }
        
        self.characterLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(self)
            make.top.equalTo(self.nameLabel.snp.bottom).offset(2)
            make.leading.trailing.equalTo(0)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.starImageView.snp.makeConstraints { (make) in
            make.leading.equalTo(10)
            make.trailing.equalTo(-10)
            make.height.equalTo(starImageView.frame.size.width)
            make.top.equalTo(10)
        }
        starImageView.layer.cornerRadius = starImageView.frame.size.width/2
        starImageView.clipsToBounds = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
