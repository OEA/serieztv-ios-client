//
//  STAboutView.swift
//  serieztv
//
//  Created by Goktug on 31/12/2016.
//  Copyright © 2016 serieztv. All rights reserved.
//

import UIKit

class STAboutView: UIView {
    
    let aboutLabel: UILabel = {
        let aboutLabel = UILabel()
        aboutLabel.textAlignment = .center
        aboutLabel.numberOfLines = 0
        aboutLabel.font = UIFont.boldSystemFont(ofSize: 16)
        aboutLabel.text = "SeriezTV is an application developed as a social media platform regarding movies and TV series in order to help people for socialize by using their favourite movies, stars and TV series."
        return aboutLabel
    }()
    
    let courseLabel: UILabel = {
        let courseLabel = UILabel()
        courseLabel.textAlignment = .center
        courseLabel.numberOfLines = 0
        courseLabel.font = UIFont.boldSystemFont(ofSize: 16)
        courseLabel.text = "This application created for CS 401 Senior Project Course of Ozyegin University, Department of Computer Science."
        return courseLabel
    }()
    
    
    let byLabel: UILabel = {
        let byLabel = UILabel()
        byLabel.numberOfLines = 0
        byLabel.font = UIFont.boldSystemFont(ofSize: 13)
        byLabel.textAlignment = .center
        byLabel.text = "Created By\nÖmer Emre Aslan\nGöktuğ Berk Ulu"
        return byLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        self.setupAboutView()
    }
    
    func setupAboutView() {
        self.addSubview(aboutLabel)
        self.addSubview(courseLabel)
        self.addSubview(byLabel)
        
        aboutLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(self)
            make.top.equalTo(20)
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
        }
        
        courseLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(self)
            make.top.equalTo(aboutLabel.snp.bottom).offset(20)
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
        }
        
        byLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(aboutLabel)
            make.top.equalTo(courseLabel.snp.bottom).offset(20)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
