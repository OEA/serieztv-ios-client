//
//  CalendarCell.swift
//  serieztv
//
//  Created by Goktug on 23/05/2017.
//  Copyright © 2017 serieztv. All rights reserved.
//

import UIKit
import JTAppleCalendar

class CalendarCell: JTAppleCell {
    
    let label: UILabel = {
        let label = UILabel()
        return label
    }()
    
    
    let selectedView: UIView = {
        let selectedView = UIView()
        selectedView.layer.cornerRadius = 15
        selectedView.backgroundColor = .yellow
        selectedView.isHidden = true
        return selectedView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(selectedView)
        contentView.addSubview(label)
        
        label.snp.makeConstraints { (make) in
            make.center.equalTo(self)
        }
        
        selectedView.snp.makeConstraints { (make) in
            make.center.equalTo(self)
            make.width.height.equalTo(30)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
