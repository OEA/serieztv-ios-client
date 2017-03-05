//
//  STWatchlistTableViewCell.swift
//  serieztv
//
//  Created by Goktug on 27/02/2017.
//  Copyright © 2017 serieztv. All rights reserved.
//

import UIKit

class STWatchlistTableViewCell: UITableViewCell {

    let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = UIFont.systemFont(ofSize: 14)
        titleLabel.textColor = UIColor.black
        return titleLabel
    }()
    
    let statusLabel: UILabel = {
        let statusLabel = UILabel()
        statusLabel.font = UIFont.italicSystemFont(ofSize: 10)
        statusLabel.textColor = UIColor.black
        return statusLabel
    }()
    
    let setStatusButton: UISwitch = {
        let setStatusButton = UISwitch()
        return setStatusButton
    }()
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubview(titleLabel)
        self.addSubview(statusLabel)
        self.addSubview(setStatusButton)
        
        titleLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(12)
            make.centerY.equalTo(self)
        }
        
        statusLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(titleLabel)
            make.top.equalTo(titleLabel.snp.bottom).offset(1)
        }
        
        setStatusButton.snp.makeConstraints { (make) in
            make.centerY.equalTo(self)
            make.trailing.equalTo(-12)
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
