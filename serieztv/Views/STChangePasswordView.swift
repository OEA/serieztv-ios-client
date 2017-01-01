//
//  STChangePasswordView.swift
//  serieztv
//
//  Created by Goktug on 31/12/2016.
//  Copyright © 2016 serieztv. All rights reserved.
//

import UIKit

class STChangePasswordView: UIView {

    
    let currentPasswordField: STTextField = {
        let passwordField = STTextField(frame: CGRect.zero, placeholder: "Current Password", image: UIImage(named:"password")!)
        passwordField.autocorrectionType = UITextAutocorrectionType.no
        passwordField.keyboardType = UIKeyboardType.default
        passwordField.returnKeyType = UIReturnKeyType.done
        passwordField.clearButtonMode = UITextFieldViewMode.whileEditing;
        passwordField.contentVerticalAlignment = UIControlContentVerticalAlignment.center
        passwordField.tag = 1
        return passwordField
    }()
    
    let newPasswordField: UITextField = {
        let newPasswordField = STTextField(frame: CGRect.zero, placeholder: "New Password", image: UIImage(named:"password")!)
        newPasswordField.autocorrectionType = UITextAutocorrectionType.no
        newPasswordField.keyboardType = UIKeyboardType.default
        newPasswordField.returnKeyType = UIReturnKeyType.done
        newPasswordField.clearButtonMode = UITextFieldViewMode.whileEditing;
        newPasswordField.contentVerticalAlignment = UIControlContentVerticalAlignment.center
        newPasswordField.tag = 1
        return newPasswordField
    }()
    
    let againPasswordField: UITextField = {
        let againPasswordField = STTextField(frame: CGRect.zero, placeholder: "New Password (again)", image: UIImage(named:"password")!)
        againPasswordField.autocorrectionType = UITextAutocorrectionType.no
        againPasswordField.keyboardType = UIKeyboardType.default
        againPasswordField.returnKeyType = UIReturnKeyType.done
        againPasswordField.clearButtonMode = UITextFieldViewMode.whileEditing;
        againPasswordField.contentVerticalAlignment = UIControlContentVerticalAlignment.center
        againPasswordField.tag = 1
        return againPasswordField
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.lightGray
        self.addSubview(currentPasswordField)
        self.addSubview(newPasswordField)
        self.addSubview(againPasswordField)
        
        currentPasswordField.snp.makeConstraints { (make) in
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
            make.top.equalTo(30)
            make.height.equalTo(40)
        }
        
        newPasswordField.snp.makeConstraints { (make) in
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
            make.top.equalTo(currentPasswordField.snp.bottom).offset(20)
            make.height.equalTo(40)
        }
        
        againPasswordField.snp.makeConstraints { (make) in
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
            make.top.equalTo(newPasswordField.snp.bottom).offset(20)
            make.height.equalTo(40)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
