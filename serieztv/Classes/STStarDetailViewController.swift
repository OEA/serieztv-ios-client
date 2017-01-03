//
//  STStarDetailViewController.swift
//  serieztv
//
//  Created by Goktug on 01/01/2017.
//  Copyright © 2017 serieztv. All rights reserved.
//

import UIKit
// PROTOCOL TO NAVIGATE DETAIL OF A MOVIE/SERIES FROM CELL COLLECTION VIEW
protocol NavigateToMediaDetailDelegate {
    func navigateToMedia(vc: STDetailViewController)
}

class STStarDetailViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, NavigateToMediaDetailDelegate {
    
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
        backButton.addTarget(self, action: #selector(self.navigateBack), for: .touchUpInside)
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
        self.title = "Star"

        collectionView.register(STStarDetailTopViewCell.self, forCellWithReuseIdentifier: "StarDetailInfoCell")
        collectionView.register(STStarDetailMediaCollectionViewCell.self, forCellWithReuseIdentifier: "StarDetailMediaCell")
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
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StarDetailInfoCell", for: indexPath) as! STStarDetailTopViewCell
            cell.backgroundImage.image = UIImage(named: "got")
            return cell
        } else if indexPath.row == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StarDetailMediaCell", for: indexPath) as! STStarDetailMediaCollectionViewCell
            cell.titleLabel.text = "Movies"
            cell.mediaDetailDelegate = self
            return cell
        } else if indexPath.row == 2 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StarDetailMediaCell", for: indexPath) as! STStarDetailMediaCollectionViewCell
            cell.titleLabel.text = "Series"
            cell.mediaDetailDelegate = self
            return cell
        }
        return UICollectionViewCell()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.row == 0 {
            return CGSize(width: self.view.frame.width, height: 255)
        } else {
            return CGSize(width: self.view.frame.width, height: 300)
        }
    }
    
    internal func navigateToMedia(vc: STDetailViewController) {
        self.navigationController?.pushViewController(vc, animated: true)
    }

}
