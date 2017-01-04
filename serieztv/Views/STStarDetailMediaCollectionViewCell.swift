//
//  STStarDetailMediaCollectionViewCell.swift
//  serieztv
//
//  Created by Goktug on 01/01/2017.
//  Copyright © 2017 serieztv. All rights reserved.
//

import UIKit

// MOVIES - SERIES OF STARS CELL WITH COLLECTION VIEW

class STStarDetailMediaCollectionViewCell: UICollectionViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var mediaDetailDelegate: NavigateToMediaDetailDelegate?
    var movies = [Movie]()
    var series = [Series]()
    let topTitleSeperator: UILabel = {
        let topSeperator = UILabel()
        topSeperator.backgroundColor = UIColor.darkGray
        return topSeperator
    }()
    
    let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "Movies"
        titleLabel.textColor = UIColor.white
        titleLabel.font = UIFont.systemFont(ofSize: 20)
        return titleLabel
    }()
    
    let bottomTitleSeperator: UILabel = {
        let bottomTitleSeperator = UILabel()
        bottomTitleSeperator.backgroundColor = UIColor.darkGray
        return bottomTitleSeperator
    }()
    
    let mediaCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let castCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return castCollectionView
    }()
    
    let bottomCastSeperator: UILabel = {
        let bottomCastSeperator = UILabel()
        bottomCastSeperator.backgroundColor = UIColor.darkGray
        return bottomCastSeperator
    }()
    
    let bottomCrewSeperator: UILabel = {
        let bottomCrewSeperator = UILabel()
        bottomCrewSeperator.backgroundColor = UIColor.darkGray
        return bottomCrewSeperator
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(colorLiteralRed: 26/255, green: 26/255, blue: 26/255, alpha: 1.0)
        self.addSubview(topTitleSeperator)
        self.addSubview(titleLabel)
        self.addSubview(mediaCollectionView)
        self.addSubview(bottomTitleSeperator)
        self.addSubview(bottomCastSeperator)
        self.addSubview(bottomCrewSeperator)
        
        self.topTitleSeperator.snp.makeConstraints { (make) in
            make.height.equalTo(0.5)
            make.leading.equalTo(0)
            make.trailing.equalTo(0)
            make.top.equalTo(0.5)
        }
        
        self.titleLabel.snp.makeConstraints { (make) in
            make.top.leading.equalTo(10)
        }
        
        self.bottomTitleSeperator.snp.makeConstraints { (make) in
            make.height.equalTo(0.5)
            make.leading.equalTo(0)
            make.trailing.equalTo(0)
            make.top.equalTo(titleLabel.snp.bottom).offset(3)
        }
        
        self.mediaCollectionView.snp.makeConstraints { (make) in
            make.leading.equalTo(10)
            make.trailing.equalTo(-10)
            make.top.equalTo(titleLabel.snp.bottom).offset(6)
            make.height.equalTo(self.frame.height - 80)
        }
        
        self.bottomCastSeperator.snp.makeConstraints { (make) in
            make.height.equalTo(0.5)
            make.leading.equalTo(0)
            make.trailing.equalTo(0)
            make.top.equalTo(mediaCollectionView.snp.bottom).offset(3)
        }
        
        self.bottomCrewSeperator.snp.makeConstraints { (make) in
            make.height.equalTo(0.5)
            make.leading.equalTo(0)
            make.trailing.equalTo(0)
            make.top.equalTo(self.snp.bottom).offset(-0.5)
        }
        
        mediaCollectionView.backgroundColor = UIColor.clear
        self.mediaCollectionView.delegate = self
        self.mediaCollectionView.dataSource = self
        self.mediaCollectionView.register(STHomeDetailCell.self, forCellWithReuseIdentifier: "MediaDetailFromStarCell")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        print("hayt: \(frame.height)")
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: frame.height - 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MediaDetailFromStarCell", for: indexPath) as! STHomeDetailCell
        cell.nameLabel.text = "Movie"
        cell.detailLabel.text = "Character Name"
        cell.image.image = UIImage(named: "twd")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = STDetailViewController()
        self.mediaDetailDelegate?.navigateToMedia(vc: vc)
    }
    
}
