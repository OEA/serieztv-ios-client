//
//  STDetailViewController.swift
//  serieztv
//
//  Created by Goktug on 27/12/2016.
//  Copyright © 2016 serieztv. All rights reserved.
//

import UIKit

// PROTOCOL TO NAVIGATE DETAIL OF CREW FROM CELL COLLECTION VIEW
protocol NavigateToSeasonsDetailDelegate {
    func navigateToSeasons(vc: STSeasonViewController)
}
// PROTOCOL TO NAVIGATE DETAIL OF A STAR FROM CELL COLLECTION VIEW
protocol NavigateToStarDetailDelegate {
    func navigateToStar(vc: STStarDetailViewController)
}

class STDetailViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, NavigateToSeasonsDetailDelegate, NavigateToStarDetailDelegate, RateViewDelegate {
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collectionView
    }()
    
    var user: User = User()
    
    let backButton: UIButton = {
        let searchButton = UIButton(type: .custom)
        searchButton.setImage(UIImage(named: "icnBack"), for: .normal)
        searchButton.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        return searchButton
    }()
    
    var movie: Movie?
    var series: Series?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(self.collectionView)
        self.collectionView.snp.makeConstraints { (make) in
            make.leading.equalTo(0)
            make.trailing.equalTo(0)
            make.top.equalTo(0)
            make.bottom.equalTo(0)
        }
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        
        
        collectionView.register(STTopDetailCollectionViewCell.self, forCellWithReuseIdentifier: "DetailHeaderCell")
        collectionView.register(STDetailInformationCollectionViewCell.self, forCellWithReuseIdentifier: "DetailInfoCell")
        collectionView.register(STDetailCastCollectionViewCell.self, forCellWithReuseIdentifier: "DetailCastCell")
        
        backButton.addTarget(self, action: #selector(self.navigateBack), for: .touchUpInside)
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
        let userDefaults = UserDefaults.standard
        user.username = userDefaults.string(forKey: "username")
        user.id = userDefaults.string(forKey: "id")
        user.email = userDefaults.string(forKey: "email")
        if movie != nil {
            self.title = movie!.name
        } else {
            self.title = series!.name
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func navigateBack() {
        let navController = self.navigationController
        _ = navController?.popViewController(animated: true)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DetailHeaderCell", for: indexPath) as! STTopDetailCollectionViewCell
            cell.posterImageView.image = UIImage(named: "placeholder")
            cell.delegate = self
            if movie != nil {
                RatingManager.sharedInstance.getRateOfMovieForUser(user: user, movie: movie!, completion: { (rating) in
                        cell.ratingView.value = CGFloat(rating.rating)
                }, errorCompletion: nil)
                cell.posterImageView.sd_setImage(with: NSURL(string: "http://localhost:3000/images/backdrop/w780/\(movie!.id!).jpg")! as URL, placeholderImage:UIImage(named:"placeholder"))
                cell.nameLabel.text = movie!.name
                let strDate = movie!.airDate
                cell.yearLabel.text = self.getYear(strDate: strDate!)
                cell.typeLabel.text = "Movie"
                cell.timeLabel.text = "| \(Int(movie!.runtime!)) mins"
                var genres = ""
                for genre in movie!.genres! {
                    genres += "\(genre.name!) "
                }
                cell.genresLabel.text = "| \(genres)"
                
            } else {
                RatingManager.sharedInstance.getRateOfSeriesForUser(user: user, series: series!, completion: { (rating) in
                    cell.ratingView.value = CGFloat(rating.rating)
                }, errorCompletion: nil)
                cell.posterImageView.sd_setImage(with: NSURL(string: "http://localhost:3000/images/backdrop/w780/\(series!.id!).jpg")! as URL, placeholderImage:UIImage(named:"placeholder"))
                cell.nameLabel.text = series!.name
                let strDate = series!.firstAir
                cell.yearLabel.text = self.getYear(strDate: strDate!)
                cell.typeLabel.text = "TV Series"
                cell.timeLabel.text = "| \(Int(series!.runtime!)) mins"
                var genres = ""
                for genre in series!.genres! {
                    genres += "\(genre.name!) "
                }
                cell.genresLabel.text = "| \(genres)"
                
            }
            return cell
        } else if indexPath.row == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DetailInfoCell", for: indexPath) as! STDetailInformationCollectionViewCell
            if movie != nil {
                cell.detailImageView.sd_setImage(with: NSURL(string: "http://localhost:3000/images/poster/w92/\(movie!.id!).jpg")! as URL, placeholderImage:UIImage(named:"placeholder"))
                cell.overviewText.text = movie!.overview!
                cell.rateLabel.text = "\(movie!.imdbRating!)"
                cell.rateCountLabel.text = "\(Int(movie!.imdbScore!))"
                cell.addWatchlistButton.addTarget(self, action: #selector(self.addToList), for: .touchUpInside)
                cell.addWatchlistTextButton.addTarget(self, action: #selector(self.addToList), for: .touchUpInside)
                cell.followButton.addTarget(self, action: #selector(self.followMovie), for: .touchUpInside)
                cell.followTextButton.addTarget(self, action: #selector(self.followMovie), for: .touchUpInside)
            } else {
                cell.detailImageView.sd_setImage(with: NSURL(string: "http://localhost:3000/images/poster/w92/\(series!.id!).jpg")! as URL, placeholderImage:UIImage(named:"placeholder"))
                cell.overviewText.text = series!.overview!
                cell.rateLabel.text = "\(series!.imdbRating!)"
                cell.rateCountLabel.text = "\(Int(series!.imdbScore!))"
                cell.addWatchlistButton.addTarget(self, action: #selector(self.addToList), for: .touchUpInside)
                cell.addWatchlistTextButton.addTarget(self, action: #selector(self.addToList), for: .touchUpInside)
                cell.followButton.addTarget(self, action: #selector(self.followSeries), for: .touchUpInside)
                cell.followTextButton.addTarget(self, action: #selector(self.followSeries), for: .touchUpInside)
            }
            return cell
        } else if indexPath.row == 2 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DetailCastCell", for: indexPath) as! STDetailCastCollectionViewCell
            if movie != nil {
                cell.characters = movie!.characters
            } else {
                cell.characters = series!.characters
                cell.seasons = series!.seasons
            }
            cell.navDelegate = self
            cell.starDetailDelegate = self
            
            if movie != nil {
                cell.seasonsButton.isHidden = true
                cell.bottomSeasonSeperator.isHidden = true
            } else {
                cell.seasonsButton.isHidden = false
                cell.bottomSeasonSeperator.isHidden = false
            }
            
            return cell
            
            
        }
        return UICollectionViewCell()
    }
    
    func addToList() {
        let vc = STWatchlistTableViewController()
        vc.isAdding = true
        vc.user = self.user
        if movie != nil {
            vc.isMovie = true
            vc.mediaId = (movie?.id)!
        } else {
            vc.isMovie = false
            vc.mediaId = (series?.id)!
        }
        self.navigationController?.pushViewController(vc, animated: true)

    }
    
    func followMovie() {
        AuthManager.sharedInstance.followMovie(userId: self.user.id, movieId: (movie?.id)!, completion: { (user) in
           // self.user = user
        }, errorCompletion: nil)
    }
    
    func followSeries() {
        AuthManager.sharedInstance.followSeries(userId: self.user.id, seriesId: (series?.id)!, completion: { (user) in
           // self.user = user
        }, errorCompletion: nil)
    }
    
    private func getYear(strDate: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let date = dateFormatter.date(from:strDate)
        let calendar = Calendar.current
        
        let year = calendar.component(.year, from: date!)
        return "\(year)"
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.row == 0 {
            return CGSize(width: self.view.frame.width, height: 255)
        } else if indexPath.row == 1 {
            return CGSize(width: self.view.frame.width, height: 160)
        }
        else if indexPath.row == 2 {
            return CGSize(width: self.view.frame.width, height: 225)
        }
        return CGSize(width: self.view.frame.width, height: self.view.frame.height/2)
        
    }
    
    internal func navigateToSeasons(vc: STSeasonViewController) {
        vc.title = self.series?.name
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    internal func navigateToStar(vc: STStarDetailViewController) {
        self.navigationController?.pushViewController(vc, animated: true)
    }

    func rate(cell: STTopDetailCollectionViewCell, sender: SwiftyStarRatingView) {
        var movieId: String? = nil
        var seriesId: String? = nil
        if movie != nil {
            movieId = (movie?.id)!
        } else {
            seriesId = (series?.id)!
        }
        
        RatingManager.sharedInstance.rate(user: self.user, movieId: movieId, seriesId: seriesId,
                                          rating: Double(sender.value), completion: { (rate) in
            cell.ratingView.value = CGFloat(rate.rating)
        }, errorCompletion: nil)
        
    }
    
    func ratePressed(cell: STTopDetailCollectionViewCell) {
        if cell.ratingView.alpha == 1.0 {
            UIView.animate(withDuration: 1.0, animations: {
                cell.ratingView.alpha = 0.0
                cell.topView.alpha = 1.0
            })
        } else {
            UIView.animate(withDuration: 1.0, animations: {
                cell.ratingView.alpha = 1.0
                cell.topView.alpha = 0.0
            })
            
        }
    }
}
