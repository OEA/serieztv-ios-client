//
//  DetailView.swift
//  serieztv
//
//  Created by Goktug on 27/12/2016.
//  Copyright © 2016 serieztv. All rights reserved.
//

import UIKit

class STDetailView: UIView {
    
    let nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.text = "Detail Name"
        nameLabel.textColor = UIColor.white
        nameLabel.font = UIFont.systemFont(ofSize: 14)
        nameLabel.adjustsFontSizeToFitWidth = true
        return nameLabel
    }()
    
    let yearLabel: UILabel = {
        let yearLabel = UILabel()
        yearLabel.text = "Year"
        yearLabel.textColor = UIColor.white
        yearLabel.font = UIFont.systemFont(ofSize: 12)
        yearLabel.adjustsFontSizeToFitWidth = true
        return yearLabel
    }()
    
    let timeLabel: UILabel = {
        let timeLabel = UILabel()
        timeLabel.text = "DD/MM/YY"
        timeLabel.textColor = UIColor.white
        timeLabel.font = UIFont.systemFont(ofSize: 12)
        timeLabel.adjustsFontSizeToFitWidth = true
        return timeLabel
    }()
    
    let genresLabel: UILabel = {
        let genresLabel = UILabel()
        genresLabel.text = "Genre List"
        genresLabel.textColor = UIColor.white
        genresLabel.font = UIFont.systemFont(ofSize: 12)
        genresLabel.adjustsFontSizeToFitWidth = true
        return genresLabel
    }()
    
    let detailImageView: UIImageView = {
        let detailImageView = UIImageView()
        return detailImageView
    }()
    
    let posterImageView: UIImageView = {
        let posterImageView = UIImageView()
        return posterImageView
    }()
    
    let overviewText: UITextView = {
        let overviewText = UITextView()
        overviewText.text = "Overview of the detail"
        overviewText.textColor = UIColor.white
        overviewText.font = UIFont.systemFont(ofSize: 11)
        return overviewText
    }()
    
    let rateLabel: UILabel = {
        let rateLabel = UILabel()
        rateLabel.text = "8.4"
        rateLabel.textColor = UIColor.white
        rateLabel.font = UIFont.systemFont(ofSize: 12)
        rateLabel.adjustsFontSizeToFitWidth = true
        return rateLabel
    }()
    
    let rateCountLabel: UILabel = {
        let rateCountLabel = UILabel()
        rateCountLabel.text = "12345"
        rateCountLabel.textColor = UIColor.white
        rateCountLabel.font = UIFont.systemFont(ofSize: 10)
        rateCountLabel.adjustsFontSizeToFitWidth = true
        return rateCountLabel
    }()
    
    let castCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let castCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return castCollectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.black
        self.setupMovieDetailView()
    }
    
    func setupMovieDetailView() {
        self.addSubview(nameLabel)
        self.addSubview(yearLabel)
        self.addSubview(timeLabel)
        self.addSubview(genresLabel)
        self.addSubview(detailImageView)
        self.addSubview(overviewText)
        self.addSubview(rateLabel)
        self.addSubview(rateCountLabel)
        self.addSubview(castCollectionView)
        self.addSubview(posterImageView)
        
        self.posterImageView.snp.makeConstraints { (make) in
            make.height.equalTo(200)
        }
        
        self.nameLabel.snp.makeConstraints { (make) in
            
        }
        
        self.yearLabel.snp.makeConstraints { (make) in
            
        }
        
        self.timeLabel.snp.makeConstraints { (make) in
            
        }
        
        self.genresLabel.snp.makeConstraints { (make) in
            
        }
        
        self.detailImageView.snp.makeConstraints { (make) in
            
        }
        
        self.overviewText.snp.makeConstraints { (make) in
            
        }
        
        self.rateLabel.snp.makeConstraints { (make) in
            
        }
        
        self.rateCountLabel.snp.makeConstraints { (make) in
            
        }
        
        self.castCollectionView.snp.makeConstraints { (make) in
            
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
