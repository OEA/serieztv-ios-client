//
//  STTopDetailCollectionViewCell.swift
//  serieztv
//
//  Created by Goktug on 31/12/2016.
//  Copyright © 2016 serieztv. All rights reserved.
//

import UIKit

// TOP CELL OF MOVIE-SERIES DETAIL

protocol RateViewDelegate {
    func ratePressed(cell: STTopDetailCollectionViewCell)
    func rate(cell: STTopDetailCollectionViewCell, sender: SwiftyStarRatingView)
}


class STTopDetailCollectionViewCell: UICollectionViewCell {
    
    var delegate: RateViewDelegate!
    
    
    let posterImageView: UIImageView = {
        let posterImageView = UIImageView()
        return posterImageView
    }()
    
    let topView: UIView = {
        let topView = UIView()
        topView.backgroundColor = UIColor.darkGray
        return topView
    }()
    
    let rateView: UIView = {
        let rateView = UIView()
        rateView.backgroundColor = UIColor.darkGray
        rateView.alpha = 0.0
        return rateView
    }()
    
    let firstStar: UIButton = {
        let star = UIButton()
        star.setTitle("", for: .normal)
        star.setImage(UIImage(named: "emptystar"), for: .normal)
        return star
    }()
    
    let secondStar: UIButton = {
        let star = UIButton()
        star.setTitle("", for: .normal)
        star.setImage(UIImage(named: "emptystar"), for: .normal)
        return star
    }()
    
    let thirdStar: UIButton = {
        let star = UIButton()
        star.setTitle("", for: .normal)
        star.setImage(UIImage(named: "emptystar"), for: .normal)
        return star
    }()
    
    let fourthStar: UIButton = {
        let star = UIButton()
        star.setTitle("", for: .normal)
        star.setImage(UIImage(named: "picstar"), for: .normal)
        return star
    }()
    
    let fifthStar: UIButton = {
        let star = UIButton()
        star.setTitle("", for: .normal)
        star.setImage(UIImage(named: "picstar"), for: .normal)
        return star
    }()
    
    let sixthStar: UIButton = {
        let star = UIButton()
        star.setTitle("", for: .normal)
        star.setImage(UIImage(named: "picstar"), for: .normal)
        return star
    }()
    
    let seventhStar: UIButton = {
        let star = UIButton()
        star.setTitle("", for: .normal)
        star.setImage(UIImage(named: "emptystar"), for: .normal)
        return star
    }()
    
    let eighthStar: UIButton = {
        let star = UIButton()
        star.setTitle("", for: .normal)
        star.setImage(UIImage(named: "emptystar"), for: .normal)
        return star
    }()
    
    let ninethStar: UIButton = {
        let star = UIButton()
        star.setTitle("", for: .normal)
        star.setImage(UIImage(named: "picstar"), for: .normal)
        return star
    }()
    
    let tenthStar: UIButton = {
        let star = UIButton()
        star.setTitle("", for: .normal)
        star.setImage(UIImage(named: "picstar"), for: .normal)
        return star
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
    
    let rateButton: UIButton = {
        let rateButton = UIButton()
        rateButton.setBackgroundImage(UIImage(named:"picstar"), for: .normal)
        rateButton.setTitleColor(UIColor.white, for: .normal)
        return rateButton
    }()
    
    let ratingView: SwiftyStarRatingView = {
        let ratingView = SwiftyStarRatingView()
        ratingView.allowsHalfStars = false
        ratingView.maximumValue = 10
        ratingView.minimumValue = 0
        ratingView.emptyStarImage = UIImage(named: "emptystar")
        ratingView.filledStarImage = UIImage(named: "picstar")
        ratingView.value = 0
        ratingView.tintColor = UIColor.darkGray
        ratingView.backgroundColor = UIColor.darkGray
        ratingView.alpha = 0
        return ratingView
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
        self.topView.addSubview(rateButton)
        self.addSubview(rateView)
//        rateView.addSubview(firstStar)
//        rateView.addSubview(secondStar)
//        rateView.addSubview(thirdStar)
//        rateView.addSubview(fourthStar)
//        rateView.addSubview(fifthStar)
//        rateView.addSubview(sixthStar)
//        rateView.addSubview(seventhStar)
//        rateView.addSubview(eighthStar)
//        rateView.addSubview(ninethStar)
//        rateView.addSubview(tenthStar)
        rateButton.addTarget(self, action: #selector(rateViewClicked), for: .touchUpInside)
//        firstStar.addTarget(self, action: #selector(giveRate(sender:)), for: .touchUpInside)
        ratingView.addTarget(self, action: #selector(giveRate(sender:)), for: .valueChanged)
//        firstStar.tag = 1
//        secondStar.tag = 2
//        thirdStar.tag = 3
//        fourthStar.tag = 4
//        fifthStar.tag = 5
//        sixthStar.tag = 6
//        seventhStar.tag = 7
//        eighthStar.tag = 8
//        ninethStar.tag = 9
//        tenthStar.tag = 10
//        secondStar.addTarget(self, action: #selector(giveRate(sender:)), for: .touchUpInside)
//        thirdStar.addTarget(self, action: #selector(giveRate(sender:)), for: .touchUpInside)
//        fourthStar.addTarget(self, action: #selector(giveRate(sender:)), for: .touchUpInside)
//        fifthStar.addTarget(self, action: #selector(giveRate(sender:)), for: .touchUpInside)
//        sixthStar.addTarget(self, action: #selector(giveRate(sender:)), for: .touchUpInside)
//        seventhStar.addTarget(self, action: #selector(giveRate(sender:)), for: .touchUpInside)
//        eighthStar.addTarget(self, action: #selector(giveRate(sender:)), for: .touchUpInside)
//        ninethStar.addTarget(self, action: #selector(giveRate(sender:)), for: .touchUpInside)
//        tenthStar.addTarget(self, action: #selector(giveRate(sender:)), for: .touchUpInside)
        
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
        
        self.rateView.snp.makeConstraints { (make) in
            make.leading.equalTo(0)
            make.trailing.equalTo(0)
            make.top.equalTo(self.posterImageView.snp.bottom)
            make.height.equalTo(55)
        }
        
        addSubview(ratingView)
        ratingView.snp.makeConstraints { (make) in
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
        
        self.rateButton.snp.makeConstraints { (make) in
            make.trailing.equalTo(-10)
            make.top.equalTo(5)
            make.width.height.equalTo(45)
        }
        
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
      /*
        firstStar.snp.makeConstraints { (make) in
            make.centerY.equalTo(rateView)
            make.width.equalTo(15)
            make.height.equalTo(rateView.frame.height-10)
            make.leading.equalTo((rateView.frame.width-150)/11)
        }
        
        secondStar.snp.makeConstraints { (make) in
            make.centerY.equalTo(rateView)
            make.width.equalTo(15)
            make.height.equalTo(rateView.frame.height-10)
            make.leading.equalTo(firstStar.snp.trailing).offset((rateView.frame.width-150)/11)
        }
        
        thirdStar.snp.makeConstraints { (make) in
            make.centerY.equalTo(rateView)
            make.height.equalTo(rateView.frame.height-10)
            make.width.equalTo(15)
            make.leading.equalTo(secondStar.snp.trailing).offset((rateView.frame.width-150)/11)
        }
        
        fourthStar.snp.makeConstraints { (make) in
            make.centerY.equalTo(rateView)
            make.width.equalTo(15)
            make.height.equalTo(rateView.frame.height-10)
            make.leading.equalTo(thirdStar.snp.trailing).offset((rateView.frame.width-150)/11)
        }
        
        fifthStar.snp.makeConstraints { (make) in
            make.centerY.equalTo(rateView)
            make.width.equalTo(15)
            make.height.equalTo(rateView.frame.height-10)
            make.leading.equalTo(fourthStar.snp.trailing).offset((rateView.frame.width-150)/11)
        }
        
        sixthStar.snp.makeConstraints { (make) in
            make.centerY.equalTo(rateView)
            make.width.equalTo(15)
            make.height.equalTo(rateView.frame.height-10)
            make.leading.equalTo(fifthStar.snp.trailing).offset((rateView.frame.width-150)/11)
        }
        
        seventhStar.snp.makeConstraints { (make) in
            make.centerY.equalTo(rateView)
            make.width.equalTo(15)
            make.height.equalTo(rateView.frame.height-10)
            make.leading.equalTo(sixthStar.snp.trailing).offset((rateView.frame.width-150)/11)
        }
        
        eighthStar.snp.makeConstraints { (make) in
            make.centerY.equalTo(rateView)
            make.width.equalTo(15)
            make.height.equalTo(rateView.frame.height-10)
            make.leading.equalTo(seventhStar.snp.trailing).offset((rateView.frame.width-150)/11)
        }
        
        ninethStar.snp.makeConstraints { (make) in
            make.centerY.equalTo(rateView)
            make.width.equalTo(15)
            make.height.equalTo(rateView.frame.height-10)
            make.leading.equalTo(eighthStar.snp.trailing).offset((rateView.frame.width-150)/11)
        }
        
        tenthStar.snp.makeConstraints { (make) in
            make.centerY.equalTo(rateView)
            make.width.equalTo(15)
            make.height.equalTo(rateView.frame.height-10)
            make.leading.equalTo(ninethStar.snp.trailing).offset((rateView.frame.width-150)/11)
        }
        */
    }
    
    func rateViewClicked() {
        delegate.ratePressed(cell: self)
    }
    
    func giveRate(sender: SwiftyStarRatingView) {
        delegate.rate(cell: self, sender: sender)
    }
}
