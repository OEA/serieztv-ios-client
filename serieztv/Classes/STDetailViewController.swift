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

class STDetailViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, NavigateToSeasonsDetailDelegate, NavigateToStarDetailDelegate {
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collectionView
    }()
    
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
            if movie != nil {
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

            } else {
                cell.detailImageView.sd_setImage(with: NSURL(string: "http://localhost:3000/images/poster/w92/\(series!.id!).jpg")! as URL, placeholderImage:UIImage(named:"placeholder"))
                cell.overviewText.text = series!.overview!
                cell.rateLabel.text = "\(series!.imdbRating!)"
                cell.rateCountLabel.text = "\(Int(series!.imdbScore!))"
            }
            return cell
        } else if indexPath.row == 2 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DetailCastCell", for: indexPath) as! STDetailCastCollectionViewCell
            if movie != nil {
                cell.characters = movie!.characters
            } else {
                cell.characters = series!.characters
            }
            cell.navDelegate = self
            cell.starDetailDelegate = self
            return cell
        }
        return UICollectionViewCell()
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
}
