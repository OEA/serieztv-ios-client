//
//  STDetailViewController.swift
//  serieztv
//
//  Created by Goktug on 27/12/2016.
//  Copyright © 2016 serieztv. All rights reserved.
//

import UIKit

// PROTOCOL TO NAVIGATE DETAIL OF CREW FROM CELL COLLECTION VIEW
protocol NavigateToCrewDetailDelegate {
    func navigateToCrew(vc: STCrewListTableViewController)
}
// PROTOCOL TO NAVIGATE DETAIL OF A STAR FROM CELL COLLECTION VIEW
protocol NavigateToStarDetailDelegate {
    func navigateToStar(vc: STStarDetailViewController)
}

class STDetailViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, NavigateToCrewDetailDelegate, NavigateToStarDetailDelegate {
    
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
    
    var imageName: String!

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
        self.title = "The Walking Dead"
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
            cell.posterImageView.image = UIImage(named: imageName)
            return cell
        } else if indexPath.row == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DetailInfoCell", for: indexPath) as! STDetailInformationCollectionViewCell
            return cell
        } else if indexPath.row == 2 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DetailCastCell", for: indexPath) as! STDetailCastCollectionViewCell
            cell.navDelegate = self
            cell.starDetailDelegate = self
            return cell
        }
        return UICollectionViewCell()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.row == 0 {
            return CGSize(width: self.view.frame.width, height: 255)
        } else if indexPath.row == 1 {
            return CGSize(width: self.view.frame.width, height: 160)
        }
        else if indexPath.row == 2 {
            print("cell dis hayt: \(self.view.frame.height/2)")
            return CGSize(width: self.view.frame.width, height: 225)
        }
        return CGSize(width: self.view.frame.width, height: self.view.frame.height/2)
        
    }
    
    internal func navigateToCrew(vc: STCrewListTableViewController) {
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    internal func navigateToStar(vc: STStarDetailViewController) {
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
