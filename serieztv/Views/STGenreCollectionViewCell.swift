//
//  STGenreCollectionViewCell.swift
//  serieztv
//
//  Created by Goktug on 29/12/2016.
//  Copyright © 2016 serieztv. All rights reserved.
//

import UIKit

// GENRE CELL IN HOME VIEW

class STGenreCollectionViewCell: UICollectionViewCell {
    
    let colorArray = [UIColor.red, UIColor.blue, UIColor.green, UIColor.brown, UIColor.yellow, UIColor.orange]
    let genres = ["Action", "Drama", "Romantic", "Fantastic", "Sports", "Science Fiction", "Horror", "Thriller", "Adventure", "Crime", "History", "War", "Western", "Musical", "Animation"]
    
    let genreView: UIView = {
        let image = UIView()
        image.layer.cornerRadius = 5
        image.layer.masksToBounds = true
        return image
    }()
    
    let genreViewFirstLetterLabel: UILabel = {
        let name = UILabel()
        name.textAlignment = NSTextAlignment.center
        name.textColor = UIColor.white
        name.font = UIFont.boldSystemFont(ofSize: 40)
        return name
    }()
    
    let nameLabel: UILabel = {
        let name = UILabel()
        name.text = "Genre"
        name.textColor = UIColor.white
        name.textAlignment = NSTextAlignment.center
        name.font = UIFont.boldSystemFont(ofSize: 14)
        return name
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(genreView)
        self.addSubview(nameLabel)
        self.genreView.addSubview(genreViewFirstLetterLabel)
        
        self.genreView.snp.makeConstraints { (make) in
            make.leading.equalTo(10)
            make.trailing.equalTo(-10)
            make.height.equalTo(100)
            make.top.equalTo(10)
        }
        
        self.nameLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(self)
            make.top.equalTo(self.genreView.snp.bottom).offset(6)
        }
        
        self.genreViewFirstLetterLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.genreView)
            make.centerY.equalTo(self.genreView)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.genreView.snp.makeConstraints { (make) in
            make.leading.equalTo(10)
            make.trailing.equalTo(-10)
            make.height.equalTo(genreView.frame.size.width)
            make.top.equalTo(10)
        }
        genreView.layer.cornerRadius = genreView.frame.size.width/2
        genreView.clipsToBounds = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
