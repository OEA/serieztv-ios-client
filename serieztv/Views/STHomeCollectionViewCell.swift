//
//  STHomeCollectionViewCell.swift
//  serieztv
//
//  Created by Goktug on 13/12/2016.
//  Copyright © 2016 serieztv. All rights reserved.
//

import UIKit



class STHomeCollectionViewCell: UICollectionViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let colorArray = [UIColor.red, UIColor.blue, UIColor.green, UIColor.brown, UIColor.yellow, UIColor.orange]
    let genres = ["Action", "Drama", "Romantic", "Fantastic", "Sports", "Science Fiction", "Horror", "Thriller", "Adventure", "Crime", "History", "War", "Western", "Musical", "Animation"]
    var navDelegate: NavigateToDetailDelegate?
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0 , left: 0, bottom: 0, right: 0)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collectionView
    }()
    
    var detailCellViewIdentifier: String!
    
    
    let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.textAlignment = .center
        titleLabel.textColor = UIColor.white
        titleLabel.font = UIFont.boldSystemFont(ofSize: 16)
        return titleLabel
    }()
    
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 0
//    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        if detailCellViewIdentifier == "GenreDetailCell" {
                
            return genres.count
        }
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        cell.contentView.backgroundColor = self.contentView.backgroundColor
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if self.detailCellViewIdentifier == "DetailCell" {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DetailCell", for: indexPath) as! STHomeDetailCell
            cell.contentView.backgroundColor = self.contentView.backgroundColor
            // Configure the cell
            
            return cell
        } else if self.detailCellViewIdentifier == "GenreDetailCell" {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GenreDetailCell", for: indexPath) as! STGenreCollectionViewCell
            cell.contentView.backgroundColor = self.contentView.backgroundColor
            cell.nameLabel.text = self.genres[indexPath.row]
            cell.genreViewFirstLetterLabel.text = "\((cell.nameLabel.text?.characters.first)!)"
            let random: Int = Int(arc4random_uniform(UInt32(cell.colorArray.count)))
            cell.genreView.backgroundColor = cell.colorArray[random]
            // Configure the cell
            
            return cell

        } else if self.detailCellViewIdentifier == "StarDetailCell" {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StarDetailCell", for: indexPath) as! STStarCollectionViewCell
            cell.contentView.backgroundColor = self.contentView.backgroundColor
            cell.starImageView.image = UIImage(named: "hoc")
            // Configure the cell
            
            return cell
        } else {
            return UICollectionViewCell()
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        if self.detailCellViewIdentifier == "GenreDetailCell" {
//            return CGSize(width: 120, height: frame.height - 50)
//        }
        return CGSize(width: 100, height: frame.height - 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(0, 10, 0, 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailViewController = STDetailViewController()
        detailViewController.imageName = "twd"
        self.navDelegate?.goToDetail(vc: detailViewController)
        print("SELECTED")
    
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(collectionView)
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.register(STHomeDetailCell.self, forCellWithReuseIdentifier: "DetailCell")
        self.collectionView.register(STGenreCollectionViewCell.self, forCellWithReuseIdentifier: "GenreDetailCell")
        self.collectionView.register(STStarCollectionViewCell.self, forCellWithReuseIdentifier: "StarDetailCell")
        self.addSubview(titleLabel)
        
        
        titleLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(self)
            make.top.equalTo(15)
        }
        
        self.collectionView.snp.makeConstraints { (make) in
            make.leading.equalTo(self.snp.leading)
            make.trailing.equalTo(self.snp.trailing)
            make.top.equalTo(self.titleLabel.snp.bottom).offset(30)
            make.bottom.equalTo(self.snp.bottom)
        }
        
        self.collectionView.reloadData()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
