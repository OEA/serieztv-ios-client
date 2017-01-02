//
//  DetailCell.swift
//  serieztv
//
//  Created by Goktug on 27/12/2016.
//  Copyright © 2016 serieztv. All rights reserved.
//

import UIKit

// MOVIE - SERIES CELLS

class STHomeDetailCell: UICollectionViewCell {
    
    let image: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 5
        image.layer.masksToBounds = true
        return image
    }()

    let nameLabel: UILabel = {
        let name = UILabel()
        name.text = "name"
        name.numberOfLines = 0
        name.textColor = UIColor.white
        name.textAlignment = NSTextAlignment.center
        name.font = UIFont.boldSystemFont(ofSize: 14)
        name.adjustsFontSizeToFitWidth = true
        return name
    }()
    
    let detailLabel: UILabel = {
        let detailLabel = UILabel()
        detailLabel.text = "detail"
        detailLabel.textColor = UIColor.lightGray
        detailLabel.textAlignment = NSTextAlignment.center
        detailLabel.font = UIFont.systemFont(ofSize: 9)
        return detailLabel
    }()
    
    let rateLabel: UILabel = {
        let rateLabel = UILabel()
        rateLabel.text = "8.0"
        rateLabel.textColor = UIColor.white
        rateLabel.textAlignment = NSTextAlignment.center
        rateLabel.font = UIFont.boldSystemFont(ofSize: 12)
        return rateLabel
    }()
    
    let rateScaleLabel: UILabel = {
        let rateScaleLabel = UILabel()
        rateScaleLabel.text = "/10"
        rateScaleLabel.textColor = UIColor.lightGray
        rateScaleLabel.textAlignment = NSTextAlignment.center
        rateScaleLabel.font = UIFont.systemFont(ofSize: 10)
        return rateScaleLabel
    }()
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(image)
        self.addSubview(nameLabel)
        self.addSubview(detailLabel)
        self.addSubview(rateLabel)
        self.addSubview(rateScaleLabel)
        
        self.image.snp.makeConstraints { (make) in
            make.leading.equalTo(10)
            make.trailing.equalTo(-10)
            make.height.equalTo(120)
            make.top.equalTo(10)
        }
        
        self.nameLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(self)
            make.leading.equalTo(2)
            make.trailing.equalTo(-2)
            make.top.equalTo(self.image.snp.bottom).offset(3)
        }
        
        self.detailLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(self)
            make.top.equalTo(self.nameLabel.snp.bottom).offset(3)
        }
        
        self.rateLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(self).offset(-6)
            make.top.equalTo(detailLabel.snp.bottom).offset(12)
        }
        
        self.rateScaleLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.rateLabel)
            make.leading.equalTo(rateLabel.snp.trailing).offset(1)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


