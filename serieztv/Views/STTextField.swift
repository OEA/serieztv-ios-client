//
//  STTextField.swift
//  serieztv
//
//  Created by Goktug on 30/11/2016.
//  Copyright © 2016 serieztv. All rights reserved.
//

import UIKit

class STTextField: UITextField, UITextFieldDelegate {
    
    
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
        self.textColor = UIColor(colorLiteralRed: 251/255, green: 249/255, blue: 243/255, alpha: 1.0)
        self.placeholderLabel.text = placeholder
        self.attributedPlaceholder = placeholderLabel.attributedText
        self.fieldImageView.image = image
        self.delegate = self;
        
    }
    
    func setupTextView() {
        self.addSubview(fieldImageView)
        self.addSubview(placeholderLabel)
        
        fieldImageView.snp.makeConstraints { (make) in
            make.leading.equalTo(-10)
            make.width.equalTo(50)
            make.top.equalTo(10)
            make.bottom.equalTo(-10)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        addBottomBorderToTextField()
    }
    
    func addBottomBorderToTextField() {
        let border = CALayer()
        let width = CGFloat(0.5)
        border.borderColor = UIColor(colorLiteralRed: 233/255, green: 228/255, blue: 222/255, alpha: 1.0).cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width:  self.frame.size.width, height: self.frame.size.height)
        border.borderWidth = width
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
    
    let padding = UIEdgeInsets(top: 0, left: 50, bottom: 0, right: 5);
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let nextField = textField.superview?.viewWithTag(textField.tag + 1) as? UITextField {
            nextField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return false
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
