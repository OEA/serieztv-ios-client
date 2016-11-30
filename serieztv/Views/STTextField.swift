//
//  STTextField.swift
//  serieztv
//
//  Created by Goktug on 30/11/2016.
//  Copyright © 2016 serieztv. All rights reserved.
//

import UIKit

class STTextField: UITextField {
    
    
    let fieldImageView: UIImageView = {
        let fieldImageView = UIImageView(frame: CGRect(x:0, y:0, width:10, height:10))
        fieldImageView.contentMode = UIViewContentMode.scaleAspectFit;
        fieldImageView.clipsToBounds = true;
        return fieldImageView
    }()
    
    let placeholderLabel: UILabel = {
        let placeholderLabel = UILabel()
        placeholderLabel.textColor = UIColor(colorLiteralRed: 233/255, green: 228/255, blue: 222/255, alpha: 1.0)
        placeholderLabel.tintColor = UIColor(colorLiteralRed: 233/255, green: 228/255, blue: 222/255, alpha: 1.0)
        placeholderLabel.textAlignment = .left;
        return placeholderLabel
    }()
    
    init(frame:CGRect, placeholder: String, image: UIImage) {
        super.init(frame:frame)
        self.setupTextView()
        self.backgroundColor = UIColor.clear
        self.tintColor = UIColor.red
        self.textColor = UIColor(colorLiteralRed: 251/255, green: 249/255, blue: 243/255, alpha: 1.0)
        self.placeholderLabel.text = placeholder
        self.fieldImageView.image = image
    }
    
    func setupTextView() {
        self.addSubview(fieldImageView)
        self.addSubview(placeholderLabel)
        
        fieldImageView.snp.makeConstraints { (make) in
            make.leading.equalTo(-45)
            make.top.equalTo(10)
            make.bottom.equalTo(-10)
        }
        
        placeholderLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(fieldImageView.snp.trailing).offset(20)
            make.centerX.equalTo(self)
        }
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
