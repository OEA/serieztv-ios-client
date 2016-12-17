//
//  STHomeCollectionViewCell.swift
//  serieztv
//
//  Created by Goktug on 13/12/2016.
//  Copyright © 2016 serieztv. All rights reserved.
//

import UIKit

class STHomeCollectionViewCell: UICollectionViewCell {
    
    var name: UILabel = {
        let name = UILabel()
        name.text = "seriezTV"
        name.textColor = UIColor.red
        name.textAlignment = NSTextAlignment.center
        name.font = UIFont.systemFont(ofSize: 12)
        return name
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(name)
        self.backgroundColor = UIColor.white
        
        self.name.snp.makeConstraints { (make) in
            make.leading.equalTo(10)
            make.top.equalTo(10)
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
