//
//  STAddListView.swift
//  serieztv
//
//  Created by Goktug on 27/02/2017.
//  Copyright © 2017 serieztv. All rights reserved.
//

import UIKit

class STAddListView: UIView {
    
    let listNameField: STTextField = {
        let listNameField = STTextField(frame: CGRect.zero, placeholder: "List Name", image: UIImage(named:"plus")!)
        listNameField.autocorrectionType = UITextAutocorrectionType.no
        listNameField.keyboardType = UIKeyboardType.emailAddress
        listNameField.returnKeyType = UIReturnKeyType.continue
        listNameField.clearButtonMode = UITextFieldViewMode.whileEditing;
        listNameField.contentVerticalAlignment = UIControlContentVerticalAlignment.center
        listNameField.tag = 10
        return listNameField
    }()
    
    let setStatusLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = UIFont.systemFont(ofSize: 14)
        titleLabel.text = "Is list public?"
        titleLabel.textColor = UIColor.white
        return titleLabel
    }()
    
    let setStatusButton: UISwitch = {
        let setStatusButton = UISwitch()
        return setStatusButton
    }()
    
    let cancelButton: UIButton = {
        let cancelButton = UIButton()
        cancelButton.setImage(UIImage(named:"close"), for: .normal)
        return cancelButton
    }()
    
    let doneButton: UIButton = {
        let doneButton = UIButton()
        doneButton.setTitle("Add List", for: .normal)
        doneButton.setTitleColor(UIColor.white, for: .normal)
        doneButton.titleLabel?.adjustsFontSizeToFitWidth = true
        return doneButton
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(listNameField)
        self.addSubview(setStatusLabel)
        self.addSubview(setStatusButton)
        self.addSubview(cancelButton)
        self.addSubview(doneButton)
        self.backgroundColor = UIColor.black.withAlphaComponent(0.9)

        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        listNameField.snp.makeConstraints { (make) in
            make.leading.equalTo(self.snp.leading).offset(10)
            make.trailing.equalTo(self.snp.trailing).offset(-10)
            make.top.equalTo(self.snp.top).offset(20)
            make.height.equalTo(40)
        }
        
        setStatusLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.listNameField.snp.bottom).offset(30)
            make.leading.equalTo(self.snp.leading).offset(10)
        }
        
        setStatusButton.snp.makeConstraints { (make) in
            make.leading.equalTo(setStatusLabel.snp.trailing).offset(10)
            make.centerY.equalTo(setStatusLabel)
        }
        
        cancelButton.snp.makeConstraints { (make) in
            make.trailing.equalTo(-10)
            make.top.equalTo(10)
        }
        
        doneButton.snp.makeConstraints { (make) in
            make.centerX.equalTo(self)
            make.width.equalTo(60)
            make.top.equalTo(self.setStatusButton.snp.bottom).offset(20)
            
        }
        
        layer.cornerRadius = 5.0
    }
    

}
