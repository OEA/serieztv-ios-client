//
//  STDetailInformationCollectionViewCell.swift
//  serieztv
//
//  Created by Goktug on 30/12/2016.
//  Copyright © 2016 serieztv. All rights reserved.
//

import UIKit

// MOVIE - SERIES DETAILED INFORMATION CELL


class STDetailInformationCollectionViewCell: UICollectionViewCell {
    
    
    let detailImageView: UIImageView = {
        let detailImageView = UIImageView()
        detailImageView.image = UIImage(named: "placeholder")
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
        overviewText.numberOfLines = 6
        overviewText.textColor = UIColor.white
        overviewText.font = UIFont.systemFont(ofSize: 14)
        return overviewText
    }()
    
    let rateStarImageView: UIImageView = {
        let rateStarImageView = UIImageView()
        rateStarImageView.image = UIImage(named: "starpic")
        return rateStarImageView
    }()
    
    let rateLabel: UILabel = {
        let rateLabel = UILabel()
        rateLabel.text = "8.0"
        rateLabel.textColor = UIColor.white
        rateLabel.font = UIFont.systemFont(ofSize: 12)
        rateLabel.adjustsFontSizeToFitWidth = true
        return rateLabel
    }()
    
    let rateScaleLabel: UILabel = {
        let rateScaleLabel = UILabel()
        rateScaleLabel.text = "/10"
        rateScaleLabel.textColor = UIColor.darkGray
        rateScaleLabel.font = UIFont.systemFont(ofSize: 10)
        rateScaleLabel.adjustsFontSizeToFitWidth = true
        return rateScaleLabel
    }()
    
    let rateCountLabel: UILabel = {
        let rateCountLabel = UILabel()
        rateCountLabel.text = "12345"
        rateCountLabel.textColor = UIColor.lightGray
        rateCountLabel.font = UIFont.systemFont(ofSize: 10)
        rateCountLabel.adjustsFontSizeToFitWidth = true
        return rateCountLabel
    }()
    
    let bottomSeperator: UILabel = {
        let imageViewSeperator = UILabel()
        imageViewSeperator.backgroundColor = UIColor.darkGray
        return imageViewSeperator
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(colorLiteralRed: 26/255, green: 26/255, blue: 26/255, alpha: 1.0)
        self.addSubview(detailImageView)
        self.addSubview(overviewText)
        self.addSubview(rateLabel)
        self.addSubview(imageViewSeperator)
        self.addSubview(rateStarImageView)
        self.addSubview(rateScaleLabel)
        self.addSubview(rateCountLabel)
        self.addSubview(bottomSeperator)
        
        self.detailImageView.snp.makeConstraints { (make) in
            make.leading.equalTo(10)
            make.top.equalTo(10)
            make.height.equalTo(100)
            make.width.equalTo(70)
        }
        
        self.overviewText.snp.makeConstraints { (make) in
            make.leading.equalTo(self.detailImageView.snp.trailing).offset(10)
            make.trailing.equalTo(-10)
            make.top.equalTo(self.detailImageView.snp.top)
        }

        self.imageViewSeperator.snp.makeConstraints { (make) in
            make.height.equalTo(0.25)
            make.leading.equalTo(0)
            make.trailing.equalTo(0)
            make.top.equalTo(self.detailImageView.snp.bottom).offset(6)
        }
        
        self.rateStarImageView.snp.makeConstraints { (make) in
            make.leading.equalTo(12)
            make.top.equalTo(imageViewSeperator.snp.bottom).offset(8)
            make.width.equalTo(25)
            make.height.equalTo(25)
        }
        
        self.rateLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(rateStarImageView.snp.trailing).offset(5)
            make.top.equalTo(imageViewSeperator.snp.bottom).offset(8)
        }
        
        self.rateScaleLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(rateLabel.snp.trailing).offset(1)
            make.bottom.equalTo(rateLabel.snp.bottom)
        }
        
        self.rateCountLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.rateLabel.snp.bottom)
            make.centerX.equalTo(self.rateLabel).offset(5)
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
