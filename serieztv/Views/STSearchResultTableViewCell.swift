//
//  STSearchResultTableViewCell.swift
//  serieztv
//
//  Created by Goktug on 31/12/2016.
//  Copyright © 2016 serieztv. All rights reserved.
//

import UIKit

class STSearchResultTableViewCell: UITableViewCell {

    let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = UIFont.boldSystemFont(ofSize: 14)
        titleLabel.textColor = UIColor.white
        return titleLabel
    }()
    
    let detailLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = UIFont.boldSystemFont(ofSize: 12)
        titleLabel.textColor = UIColor.white
        return titleLabel
    }()
    
    let cellImageView: UIImageView = {
        let cellImageView = UIImageView()
        return cellImageView
    }()
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubview(titleLabel)
        self.addSubview(cellImageView)
        self.addSubview(detailLabel)
        self.backgroundColor = UIColor(colorLiteralRed: 26/255, green: 26/255, blue: 26/255, alpha: 1.0)
        self.selectionStyle = .none
        cellImageView.snp.makeConstraints { (make) in
            make.centerY.equalTo(self)
            make.leading.equalTo(10)
            make.height.equalTo(60)
            make.width.equalTo(40)
        }
        
        titleLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(self.cellImageView.snp.trailing).offset(10)
            make.centerY.equalTo(self).offset(-8)
        }
        
        detailLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.titleLabel.snp.bottom).offset(2)
            make.leading.equalTo(self.titleLabel.snp.leading)
            make.trailing.equalTo(-20)
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
