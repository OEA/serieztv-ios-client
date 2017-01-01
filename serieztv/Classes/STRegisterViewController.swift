//
//  STRegisterViewController.swift
//  serieztv
//
//  Created by Goktug on 27/11/2016.
//  Copyright © 2016 serieztv. All rights reserved.
//

import UIKit

class STRegisterViewController: UIViewController {
    
    var delegateLogin: LoginViewBackgroundImageDelegate?
    var delegateMain: MainViewBackgroundImageDelegate?
    let bgImages = [UIImage(named: "got.jpg"),UIImage(named: "twd.jpg"), UIImage(named: "sw"), UIImage(named: "avg.jpg"), UIImage(named: "hp"), UIImage(named: "bb"), UIImage(named: "hoc.jpg")]
    var imageIndex: Int = 0
    var timer = Timer()
    
    let registerView: STRegisterView = {
        let registerView: STRegisterView = STRegisterView(frame: CGRect.zero)
        return registerView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpViews()
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        let tapToDissmissKeyboard: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        view.addGestureRecognizer(tapToDissmissKeyboard)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        self.timer = Timer(
            timeInterval: 4,
            target: self,
            selector: #selector(self.changeBgImage),
            userInfo: nil,
            repeats: true)
        RunLoop.main.add(timer, forMode: RunLoopMode.commonModes)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.timer.invalidate()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    func setUpViews() {
        self.view.addSubview(registerView)
        registerView.snp.makeConstraints { (make) in
            make.top.equalTo(self.view.snp.top)
            make.bottom.equalTo(self.view.snp.bottom)
            make.leading.equalTo(self.view.snp.leading)
            make.trailing.equalTo(self.view.snp.trailing)
        }
        registerView.registerButton.addTarget(self, action:#selector(self.register), for: .touchUpInside)
        registerView.backButton.addTarget(self, action:#selector(self.navigateBack), for: .touchUpInside)
    }
    
    func register() {
        
    }
    
    func navigateBack() {
        delegateMain?.setImageIndex(index: self.imageIndex)
        delegateMain?.updateBackgroundImage(index: self.imageIndex - 1)
        delegateLogin?.setImageIndex(index: self.imageIndex)
        delegateLogin?.updateBackgroundImage(index: self.imageIndex - 1)
        self.dismiss(animated: false, completion: nil)
    }

    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func keyboardWillShow(notification: NSNotification) {
        if self.registerView.emailField.frame.origin.y + registerView.emailField.frame.size.height/2  == self.view.frame.height/2 {
            let info = notification.userInfo!
            let keyboardFrame: CGRect = (info[UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
            UIView.animate(withDuration: 1.0, animations: {
                self.registerView.emailField.frame.origin.y -= 3*keyboardFrame.height/4
                self.registerView.usernameField.frame.origin.y -= 3*keyboardFrame.height/4
                self.registerView.passwordField.frame.origin.y -= 3*keyboardFrame.height/4
                self.registerView.registerButton.frame.origin.y -= 3*keyboardFrame.height/4
                self.registerView.logo.frame.origin.y -= 3*keyboardFrame.height/4
            }, completion: nil)
        }
    }
    
    func keyboardWillHide(notification: NSNotification) {
        if self.registerView.emailField.frame.origin.y + registerView.emailField.frame.size.height/2  != self.view.frame.height/2 {
            let info = notification.userInfo!
            let keyboardFrame: CGRect = (info[UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
            UIView.animate(withDuration: 1.0, animations: {
                self.registerView.emailField.frame.origin.y += 3*keyboardFrame.height/4
                self.registerView.usernameField.frame.origin.y += 3*keyboardFrame.height/4
                self.registerView.passwordField.frame.origin.y += 3*keyboardFrame.height/4
                self.registerView.registerButton.frame.origin.y += 3*keyboardFrame.height/4
                self.registerView.logo.frame.origin.y += 3*keyboardFrame.height/4
            }, completion: nil)
        }
    }
    
    func changeBgImage() {
        UIView.animate(withDuration: 0.5, delay: 0.0, options: UIViewAnimationOptions.curveEaseOut, animations: {
            self.registerView.backgroundImageView.alpha = 0.0
        }, completion: { (finished: Bool) -> Void in
            UIView.animate(withDuration: 0.5, delay: 0.0, options: UIViewAnimationOptions.curveEaseIn, animations: {
                self.registerView.backgroundImageView.alpha = 0.5
                if self.imageIndex <  self.bgImages.count {
                    print("register \(self.imageIndex) ")
                    self.registerView.backgroundImageView.image = self.bgImages[self.imageIndex]
                    let image = self.registerView.backgroundImageView.image?.resize(image: self.registerView.backgroundImageView.image!, to: CGSize(width: self.view.frame.width/2, height: self.view.frame.height/2))
                    self.registerView.backgroundImageView.image = image
                    self.imageIndex += 1
                } else  if self.imageIndex == self.bgImages.count {
                    self.imageIndex = 0
                    self.registerView.backgroundImageView.image = self.bgImages[self.imageIndex]
                    let image = self.registerView.backgroundImageView.image?.resize(image: self.registerView.backgroundImageView.image!, to: CGSize(width: self.view.frame.width/2, height: self.view.frame.height/2))
                    self.registerView.backgroundImageView.image = image
                }
            }, completion:nil)
        })
    }
}
