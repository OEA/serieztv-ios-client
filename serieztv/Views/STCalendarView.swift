//
//  STCalendarView.swift
//  serieztv
//
//  Created by Goktug on 24/05/2017.
//  Copyright © 2017 serieztv. All rights reserved.
//

import UIKit
import JTAppleCalendar

class STCalendarView: UIView {
    
    let yearLabel: UILabel = {
        let yearLabel = UILabel()
        yearLabel.text = "year"
        yearLabel.textColor = .white
        return yearLabel
    }()
    
    let monthLabel: UILabel = {
        let monthLabel = UILabel()
        monthLabel.text = "month"
        monthLabel.textColor = .white
        return monthLabel
    }()
    
    let mondayLabel: UILabel = {
        let mondayLabel = UILabel()
        mondayLabel.text = "Mon"
        mondayLabel.textColor = .white
        return mondayLabel
    }()
    
    let tuesdayLabel: UILabel = {
        let tuesdayLabel = UILabel()
        tuesdayLabel.text = "Tue"
        tuesdayLabel.textColor = .white
        return tuesdayLabel
    }()
    
    let wednesdayLabel: UILabel = {
        let wednesdayLabel = UILabel()
        wednesdayLabel.textColor = .white
        wednesdayLabel.text = "Wed"
        return wednesdayLabel
    }()
    
    let thursdayLabel: UILabel = {
        let thursdayLabel = UILabel()
        thursdayLabel.textColor = .white
        thursdayLabel.text = "Thu"
        return thursdayLabel
    }()
    
    let fridayLabel: UILabel = {
        let fridayLabel = UILabel()
        fridayLabel.text = "Fri"
        fridayLabel.textColor = .white
        return fridayLabel
    }()
    
    let saturdayLabel: UILabel = {
        let saturdayLabel = UILabel()
        saturdayLabel.textColor = .white
        saturdayLabel.text = "Sat"
        return saturdayLabel
    }()
    
    let sundayLabel: UILabel = {
        let sundayLabel = UILabel()
        sundayLabel.textColor = .white
        sundayLabel.text = "Sun"
        return sundayLabel
    }()

    let calendarView: JTAppleCalendarView = {
        let calendarView = JTAppleCalendarView()
        calendarView.minimumLineSpacing = 0
        calendarView.minimumInteritemSpacing = 0
        return calendarView
    }()
    
    let detailCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let detailCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return detailCollectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCalendarView()
    }
    
    func setupCalendarView() {
        addSubviews()
        setupConstraints()
    }
    
    func addSubviews() {
        addSubview(yearLabel)
        addSubview(monthLabel)
        addSubview(calendarView)
        addSubview(mondayLabel)
        addSubview(tuesdayLabel)
        addSubview(thursdayLabel)
        addSubview(wednesdayLabel)
        addSubview(fridayLabel)
        addSubview(saturdayLabel)
        addSubview(sundayLabel)
        addSubview(detailCollectionView)
    }
    
    func setupConstraints() {
        let width = (UIScreen.main.bounds.width-40)/7
        let calendarHeight = (UIScreen.main.bounds.height-70)/2
       
        monthLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(20)
            make.top.equalTo(20)
        }
        
        yearLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(monthLabel.snp.trailing).offset(30)
            make.top.equalTo(20)
        }
        
        sundayLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(20)
            make.top.equalTo(monthLabel.snp.bottom).offset(20)
            make.width.equalTo(width)
        }
        
        mondayLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(sundayLabel.snp.trailing)
            make.top.equalTo(monthLabel.snp.bottom).offset(20)
            make.width.equalTo(width)
        }
        
        tuesdayLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(mondayLabel.snp.trailing)
            make.top.equalTo(monthLabel.snp.bottom).offset(20)
            make.width.equalTo(width)
        }
        
        wednesdayLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(tuesdayLabel.snp.trailing)
            make.top.equalTo(monthLabel.snp.bottom).offset(20)
            make.width.equalTo(width)
        }
        
        thursdayLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(wednesdayLabel.snp.trailing)
            make.top.equalTo(monthLabel.snp.bottom).offset(20)
            make.width.equalTo(width)
        }
        
        fridayLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(thursdayLabel.snp.trailing)
            make.top.equalTo(monthLabel.snp.bottom).offset(20)
            make.width.equalTo(width)
        }
        
        saturdayLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(fridayLabel.snp.trailing)
            make.top.equalTo(monthLabel.snp.bottom).offset(20)
            make.width.equalTo(width)
        }
        
        calendarView.snp.makeConstraints { (make) in
            make.top.equalTo(sundayLabel.snp.bottom).offset(10)
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
            make.height.equalTo(calendarHeight)
        }
        
        detailCollectionView.snp.makeConstraints { (make) in
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
            make.top.equalTo(detailCollectionView.snp.bottom)
            make.bottom.equalTo(0)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let height = (frame.height-80)/2
        calendarView.snp.makeConstraints { (make) in
            make.top.equalTo(sundayLabel.snp.bottom).offset(10)
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
            make.height.equalTo(height)
        }
    }
/*
     let selectedView: UIView = {
     let selectedView = UIView()
     selectedView.layer.cornerRadius = 15
     selectedView.alpha = 0
     selectedView.backgroundColor = .yellow
     return selectedView
     }()
     
     override init(frame: CGRect) {
     super.init(frame: frame)
     //        contentView.addSubview(selectedView)
     //
     //        contentView.addSubview(label)
     //
     //        selectedView.snp.makeConstraints { (make) in
     //           // make.center.equalTo(self)
     //            make.width.height.equalTo(30)
     //        }
 */
}
