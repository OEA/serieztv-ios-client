//
//  STDetailCastCollectionViewCell.swift
//  serieztv
//
//  Created by Goktug on 30/12/2016.
//  Copyright © 2016 serieztv. All rights reserved.
//

import UIKit

class STDetailCastCollectionViewCell: UICollectionViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var navDelegate: NavigateToCrewDetailDelegate?
    
    let topTitleSeperator: UILabel = {
        let topSeperator = UILabel()
        topSeperator.backgroundColor = UIColor.darkGray
        return topSeperator
    }()
    
    let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "Cast"
        titleLabel.textColor = UIColor.white
        titleLabel.font = UIFont.systemFont(ofSize: 20)
        return titleLabel
    }()
    
    let bottomTitleSeperator: UILabel = {
        let bottomTitleSeperator = UILabel()
        bottomTitleSeperator.backgroundColor = UIColor.darkGray
        return bottomTitleSeperator
    }()
    
    let castCollectionView: UICollectionView = {
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
    
    let crewButton: UIButton = {
        let crewButton = UIButton()
        crewButton.setTitle("Crew", for: .normal)
        crewButton.setTitleColor(UIColor.white, for: .normal)
        crewButton.backgroundColor = UIColor.clear
        crewButton.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        crewButton.titleLabel?.textAlignment = .left
        return crewButton
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
        self.addSubview(castCollectionView)
        self.addSubview(bottomTitleSeperator)
        self.addSubview(bottomCastSeperator)
        self.addSubview(crewButton)
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
       
        self.castCollectionView.snp.makeConstraints { (make) in
            make.leading.equalTo(10)
            make.trailing.equalTo(-10)
            make.top.equalTo(titleLabel.snp.bottom).offset(6)
            make.height.equalTo(self.frame.height - 80)
        }
        
        self.bottomCastSeperator.snp.makeConstraints { (make) in
            make.height.equalTo(0.5)
            make.leading.equalTo(0)
            make.trailing.equalTo(0)
            make.top.equalTo(castCollectionView.snp.bottom).offset(3)
        }
        
        self.crewButton.snp.makeConstraints { (make) in
            make.height.equalTo(25)
            make.leading.equalTo(0)
            make.trailing.equalTo(0)
            make.top.equalTo(self.bottomCastSeperator.snp.bottom).offset(3)
        }
        
        self.bottomCrewSeperator.snp.makeConstraints { (make) in
            make.height.equalTo(0.5)
            make.leading.equalTo(0)
            make.trailing.equalTo(0)
            make.top.equalTo(self.snp.bottom).offset(-0.5)
        }
  
        castCollectionView.backgroundColor = UIColor.clear
        crewButton.addTarget(self, action:#selector(STDetailCastCollectionViewCell.navigateToCrew), for: .touchUpInside)
        self.castCollectionView.delegate = self
        self.castCollectionView.dataSource = self
        self.castCollectionView.register(STStarCollectionViewCell.self, forCellWithReuseIdentifier: "CastCollectionCell")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func navigateToCrew() {
        let crewListVC: STCrewListTableViewController = STCrewListTableViewController()
        navDelegate?.navigateToCrew(vc: crewListVC)
        
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CastCollectionCell", for: indexPath) as! STStarCollectionViewCell
        cell.characterLabel.text = "Character"
        cell.starImageView.image = UIImage(named: "twd")
        return cell
    }
    
}
