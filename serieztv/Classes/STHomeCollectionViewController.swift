//
//  STHomeCollectionViewController.swift
//  serieztv
//
//  Created by Goktug on 13/12/2016.
//  Copyright © 2016 serieztv. All rights reserved.
//

import UIKit

private let reuseIdentifier = "HomeCell"

protocol NavigateToDetailDelegate {
    func goToDetail(vc: STDetailViewController)
}


class STHomeCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout, NavigateToDetailDelegate {
    
    internal func goToDetail(vc: STDetailViewController) {
        self.navigationController?.pushViewController(vc, animated: true)
    }

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
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
//        self.collectionView?.performBatchUpdates({
//            self.collectionView?.reloadData()
//        }, completion: nil)
        
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
            cell.collectionView.reloadData()
            return cell
        } else  if indexPath.item == 4 {
            cell.detailCellViewIdentifier = "GenreDetailCell"
            cell.collectionView.reloadData()
            return cell
        } else {
            cell.detailCellViewIdentifier = "StarDetailCell"
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
