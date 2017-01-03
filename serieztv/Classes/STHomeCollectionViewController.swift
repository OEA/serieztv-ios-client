//
//  STHomeCollectionViewController.swift
//  serieztv
//
//  Created by Goktug on 13/12/2016.
//  Copyright © 2016 serieztv. All rights reserved.
//


// MAIN COLLECTION VIEW OF HOME

import UIKit

private let reuseIdentifier = "HomeCell"


// PROTOCOL TO NAVIGATE DETAIL OF A MOVIE/SERIES FROM CELL COLLECTION VIEW
protocol NavigateToDetailDelegate {
    func goToDetail(vc: UIViewController)
}

protocol NavigateToGenreDetailDelegate {
    func goToGenreDetail(vc: STGenreTableViewController)
}


class STHomeCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout, NavigateToDetailDelegate, NavigateToGenreDetailDelegate {
    var movies = [Movie]()
    var topRatedMovies = [Movie]()
    var series = [Series]()
    var topRatedSeries = [Series]()
    var genres = [Genre]()
    var stars = [Star]()
    internal func goToDetail(vc: UIViewController) {
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    internal func goToGenreDetail(vc: STGenreTableViewController) {
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    let searchButton: UIButton = {
        let searchButton = UIButton(type: .custom)
        searchButton.setImage(UIImage(named: "Search"), for: .normal)
        searchButton.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        return searchButton
    }()
    
    


    let titleArray = ["Movies", "Series", "Top Rated Movies", "Top Rated Series", "Genres", "Stars"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.black
        self.collectionView?.snp.makeConstraints { (make) in
            make.top.equalTo(0)
            make.leading.equalTo(0)
            make.trailing.equalTo(0)
            make.bottom.equalTo(0)
       }
        // self.clearsSelectionOnViewWillAppear = false
//        
        self.collectionView!.register(STHomeCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.white]
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.topItem?.title = "SeriezTV"
        
        searchButton.addTarget(self, action: #selector(self.search), for: .touchUpInside)
        let navigationBarSearchItem = UIBarButtonItem(customView: searchButton)
        
        
        self.navigationItem.setRightBarButtonItems([navigationBarSearchItem], animated: true)
        
        MovieManager.sharedInstance.getTopMovies(withLimit: 20, completion: { (movies) in
            self.movies = movies
            self.collectionView?.reloadData()
        }, errorCompletion: nil)
        
        MovieManager.sharedInstance.getRecentMovies(withLimit: 20, completion: { (movies) in
            self.topRatedMovies = movies
            self.collectionView?.reloadData()
        }, errorCompletion: nil)
        
        SeriesManager.sharedInstance.getRecentSeriesList(withLimit: 20, completion: { (series) in
            self.series = series
            self.collectionView?.reloadData()
        }, errorCompletion: nil)
        
        SeriesManager.sharedInstance.getTopSeriesList(withLimit: 20, completion: { (series) in
            self.topRatedSeries = series
            self.collectionView?.reloadData()
        }, errorCompletion: nil)
        
        GenreManager.sharedInstance.getGenreList(withLimit: 20, completion: { (genres) in
            self.genres = genres
            self.collectionView?.reloadData()
        }, errorCompletion: nil)
        
        StarManager.sharedInstance.getStarList(completion: { (stars) in
            self.stars = stars
            self.collectionView?.reloadData()
        }, errorCompletion: nil)
    }
    
    func search() {
        let searchVC = STSearchViewController()
        self.navigationController?.pushViewController(searchVC, animated: true)
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! STHomeCollectionViewCell

        cell.titleLabel.text = self.titleArray[indexPath.item]
        cell.navDelegate = self
        cell.genreNavDelegate = self
        
        if indexPath.item % 2 == 0 {
            cell.contentView.backgroundColor = UIColor(colorLiteralRed: 26/255, green: 26/255, blue: 26/255, alpha: 1.0)
            cell.collectionView.backgroundColor = UIColor(colorLiteralRed: 26/255, green: 26/255, blue: 26/255, alpha: 1.0)
            cell.backgroundView?.backgroundColor = UIColor(colorLiteralRed: 26/255, green: 26/255, blue: 26/255, alpha: 1.0)
            
        } else {
            cell.backgroundView?.backgroundColor = UIColor.black
            cell.collectionView.backgroundColor = UIColor.black
            cell.contentView.backgroundColor = UIColor.black
        }
        
        if indexPath.item < 4 {
            cell.detailCellViewIdentifier = "DetailCell"
            
            if indexPath.item == 0 {
                cell.isSeriesSelected = false
                cell.movies = self.movies
            } else if indexPath.item == 1 {
                cell.isSeriesSelected = true
                cell.series = self.series
            } else if indexPath.item == 2 {
                cell.isSeriesSelected = false
                cell.movies = self.movies
            } else if indexPath.item == 3 {
                cell.isSeriesSelected = true
                cell.series = self.topRatedSeries
            }
            cell.collectionView.reloadData()
            return cell
        } else  if indexPath.item == 4 {
            cell.detailCellViewIdentifier = "GenreDetailCell"
            cell.genres = self.genres
            cell.isGenresSelected = true
            cell.collectionView.reloadData()
            return cell
        } else {
            cell.detailCellViewIdentifier = "StarDetailCell"
            cell.stars = self.stars
            cell.isStarSelected = true
            cell.collectionView.reloadData()
            return cell
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: view.frame.width, height: 265)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(0, 0, 0, 0)
    }
}
