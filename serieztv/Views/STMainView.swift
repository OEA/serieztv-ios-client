//
//  STMainView.swift
//  serieztv
//
//  Created by Goktug on 11/12/2016.
//  Copyright © 2016 serieztv. All rights reserved.
//

import UIKit

class STMainView: UIView {
    
    let backgroundImageView: UIImageView = {
        let backgroundImageView = UIImageView()
        backgroundImageView.contentMode = .scaleToFill
        backgroundImageView.image = UIImage(named: "hoc.jpg")
        return backgroundImageView
    }()
    
    let logo: UILabel = {
        let logo = UILabel()
        logo.text = "seriezTV"
        logo.textColor = UIColor.white
        logo.textAlignment = NSTextAlignment.center
        logo.font = UIFont.systemFont(ofSize: 50)
        logo.adjustsFontSizeToFitWidth = true
        return logo
    }()
    
    let loginButton: UIButton = {
        let loginButton = UIButton()
        loginButton.setTitle("Sign In", for: .normal)
        loginButton.setTitleColor(UIColor(colorLiteralRed: 251/255, green: 249/255, blue: 243/255, alpha: 1.0), for:.normal)
        loginButton.backgroundColor = UIColor(colorLiteralRed: 238/255, green: 99/255, blue: 131/255, alpha: 1.0)
        loginButton.layer.cornerRadius = 20
        loginButton.layer.borderWidth = 1
        return loginButton
    }()

    let registerButton: UIButton = {
        let registerButton = UIButton()
        registerButton.setTitle("Sign Up", for: .normal)
        registerButton.setTitleColor(UIColor(colorLiteralRed: 251/255, green: 249/255, blue: 243/255, alpha: 1.0), for:.normal)
        registerButton.backgroundColor = UIColor(colorLiteralRed: 238/255, green: 99/255, blue: 131/255, alpha: 1.0)
        registerButton.layer.cornerRadius = 20
        registerButton.layer.borderWidth = 1
        return registerButton
    }()
    
   
    override init (frame : CGRect) {
        super.init(frame : frame)
        self.backgroundColor = UIColor.black
        setupMainView()
        self.backgroundImageView.image = UIImage(named: "hoc.jpg")
        let image = self.backgroundImageView.image?.resize(image: self.backgroundImageView.image!, to: CGSize(width: self.frame.width/2, height: self.frame.height/2))
        self.backgroundImageView.image = image
        self.backgroundImageView.alpha = 0.5
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupMainView() {
        self.addSubview(backgroundImageView)
        self.addSubview(logo)
        self.addSubview(loginButton)
        self.addSubview(registerButton)
        
        backgroundImageView.snp.makeConstraints { (make) in
            make.top.equalTo(self.snp.top)
            make.bottom.equalTo(self.snp.bottom)
            make.leading.equalTo(self.snp.leading)
            make.trailing.equalTo(self.snp.trailing)
        }
        
        logo.snp.makeConstraints { (make) in
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
            make.centerY.equalTo(self)
        }
        
        loginButton.snp.makeConstraints { (make) in
            make.centerY.equalTo(self).offset(50)
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
            make.height.equalTo(50)
        }
        
        registerButton.snp.makeConstraints { (make) in
            make.top.equalTo(self.loginButton.snp.bottom).offset(20)
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
            make.height.equalTo(50)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.loginButton.layer.shadowColor = UIColor.black.cgColor
        self.loginButton.layer.shadowOpacity = 1
        self.loginButton.layer.shadowOffset = CGSize.zero
        self.loginButton.layer.shadowRadius = 20
        
        self.registerButton.layer.shadowColor = UIColor.black.cgColor
        self.registerButton.layer.shadowOpacity = 1
        self.registerButton.layer.shadowOffset = CGSize.zero
        self.registerButton.layer.shadowRadius = 20
    }
}

extension UIImage {
    
    func resize(image: UIImage, to size: CGSize) -> UIImage {
        
        var newCropWidth: CGFloat!
        var newCropHeight: CGFloat!
        
        if(image.size.width < image.size.height){
            if (image.size.width < size.width) {
                newCropWidth = size.width
            }
            else {
                newCropWidth = image.size.width;
            }
            newCropHeight = (newCropWidth * size.height)/size.width
        } else {
            if (image.size.height < size.height) {
                newCropHeight = size.height
            }
            else {
                newCropHeight = image.size.height
            }
            newCropWidth = (newCropHeight * size.width)/size.height
        }

        let x = image.size.width/2.0 - newCropWidth/2.0
        let y = image.size.height/2.0 - newCropHeight/2.0
        
        let cropRect: CGRect = CGRect(x:x, y:y, width:newCropWidth, height:newCropHeight)
        let imageRef: CGImage = image.cgImage!.cropping(to: cropRect)!
        
        let cropped: UIImage = UIImage(cgImage:imageRef)
        
        return cropped;
    }
}

