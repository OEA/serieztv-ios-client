//
//  STProfileTableViewCell.swift
//  serieztv
//
//  Created by Goktug on 30/12/2016.
//  Copyright © 2016 serieztv. All rights reserved.
//

import UIKit

class STProfileTableViewCell: UITableViewCell {
    
    let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        titleLabel.textColor = UIColor.black
        return titleLabel
    }()
    
    let cellImageView: UIImageView = {
        let cellImageView = UIImageView()
        
        cellImageView.backgroundColor = .clear
        return cellImageView
    }()
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubview(titleLabel)
        self.addSubview(cellImageView)
        cellImageView.snp.makeConstraints { (make) in
            make.centerY.equalTo(self)
            make.leading.equalTo(10)
            make.height.equalTo(50)
            make.width.equalTo(50)
        }
        
        titleLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(self.cellImageView.snp.trailing).offset(20)
            make.centerY.equalTo(self)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
