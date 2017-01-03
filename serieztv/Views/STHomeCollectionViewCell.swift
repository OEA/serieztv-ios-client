//
//  STHomeCollectionViewCell.swift
//  serieztv
//
//  Created by Goktug on 13/12/2016.
//  Copyright © 2016 serieztv. All rights reserved.
//

import UIKit
import SDWebImage

// HOME VIEW MAIN CELLS

class STHomeCollectionViewCell: UICollectionViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    var movies = [Movie]()
    var series = [Series]()
    var isSeriesSelected = false
    var isGenresSelected = false
    let colorArray = [UIColor.red, UIColor.blue, UIColor.green, UIColor.brown, UIColor.yellow, UIColor.orange]
    var genres = [Genre]()
    var navDelegate: NavigateToDetailDelegate?
    var genreNavDelegate: NavigateToGenreDetailDelegate?
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0 , left: 0, bottom: 0, right: 0)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isPagingEnabled = true
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
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if detailCellViewIdentifier == "GenreDetailCell" {
            return genres.count
        } else if detailCellViewIdentifier == "DetailCell" {
            if isSeriesSelected {
                return series.count
            } else {
                return movies.count
            }
            
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
            if isSeriesSelected {
                cell.nameLabel.text = series[indexPath.row].name
                cell.image.image = UIImage(named: "twd")
                cell.rateLabel.text = "\(series[indexPath.row].imdbRating!)"
                cell.detailLabel.text = series[indexPath.row].status!
                cell.image.sd_setImage(with: NSURL(string: "http://localhost:3000/images/poster/w92/\(series[indexPath.row].id!).jpg")! as URL, placeholderImage:UIImage(named:"twd"))
            } else {
                cell.nameLabel.text = movies[indexPath.row].name
                cell.image.image = UIImage(named: "twd")
                cell.rateLabel.text = "\(movies[indexPath.row].imdbRating!)"
                cell.detailLabel.text = movies[indexPath.row].status!
                cell.image.sd_setImage(with: NSURL(string: "http://localhost:3000/images/poster/w92/\(movies[indexPath.row].id!).jpg")! as URL, placeholderImage:UIImage(named:"twd"))
            }
            
        
            return cell
        } else if self.detailCellViewIdentifier == "GenreDetailCell" {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GenreDetailCell", for: indexPath) as! STGenreCollectionViewCell
            cell.contentView.backgroundColor = self.contentView.backgroundColor
            cell.nameLabel.text = self.genres[indexPath.row].name
            cell.genreViewFirstLetterLabel.text = "\((cell.nameLabel.text?.characters.first)!)"
            let random: Int = Int(arc4random_uniform(UInt32(cell.colorArray.count)))
            cell.genreView.backgroundColor = cell.colorArray[random]
            return cell

        } else if self.detailCellViewIdentifier == "StarDetailCell" {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StarDetailCell", for: indexPath) as! STStarCollectionViewCell
            cell.contentView.backgroundColor = self.contentView.backgroundColor
            cell.starImageView.image = UIImage(named: "hoc")
            return cell
        } else {
            return UICollectionViewCell()
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: frame.height - 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(0, 10, 0, 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailViewController = STDetailViewController()
        let genreDetailViewController = STGenreTableViewController()
        if isSeriesSelected {
            detailViewController.series = self.series[indexPath.row]
            self.navDelegate?.goToDetail(vc: detailViewController)
        } else if isGenresSelected {
            genreDetailViewController.genre = self.genres[indexPath.row]
            self.genreNavDelegate?.goToGenreDetail(vc: genreDetailViewController)
        } else {
            detailViewController.movie = self.movies[indexPath.row]
            self.navDelegate?.goToDetail(vc: detailViewController)
        }
    
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
