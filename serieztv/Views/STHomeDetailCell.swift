//
//  DetailCell.swift
//  serieztv
//
//  Created by Goktug on 27/12/2016.
//  Copyright © 2016 serieztv. All rights reserved.
//

import UIKit

class STHomeDetailCell: UICollectionViewCell {
    
    let image: UIImageView = {
        let image = UIImageView()
        return image
    }()

    let nameLabel: UILabel = {
        let name = UILabel()
        name.text = "name"
        name.textColor = UIColor.white
        name.textAlignment = NSTextAlignment.center
        name.font = UIFont.systemFont(ofSize: 14)
        return name
    }()
    
    let detailLabel: UILabel = {
        let detailLabel = UILabel()
        detailLabel.text = "detail"
        detailLabel.textColor = UIColor.white
        detailLabel.textAlignment = NSTextAlignment.center
        detailLabel.font = UIFont.systemFont(ofSize: 9)
        return detailLabel
    }()
    
    let rateLabel: UILabel = {
        let rateLabel = UILabel()
        rateLabel.text = "8/10"
        rateLabel.textColor = UIColor.white
        rateLabel.textAlignment = NSTextAlignment.center
        rateLabel.font = UIFont.systemFont(ofSize: 12)
        return rateLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(image)
        self.addSubview(nameLabel)
        self.addSubview(detailLabel)
        self.addSubview(rateLabel)
        self.image.image = UIImage(named: "twd")
        
        self.image.snp.makeConstraints { (make) in
            make.leading.equalTo(10)
            make.trailing.equalTo(-10)
            make.height.equalTo(120)
            make.top.equalTo(10)
        }
        
        self.nameLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(self)
            make.top.equalTo(self.image.snp.bottom).offset(3)
        }
        
        self.detailLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(self)
            make.top.equalTo(self.nameLabel.snp.bottom).offset(3)
        }
        
        self.rateLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(self)
            make.top.equalTo(detailLabel.snp.bottom).offset(3)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
