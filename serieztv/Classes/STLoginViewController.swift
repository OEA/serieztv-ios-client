//
//  STLoginViewController.swift
//  serieztv
//
//  Created by Goktug on 27/11/2016.
//  Copyright © 2016 serieztv. All rights reserved.
//

import UIKit
import SnapKit


protocol LoginViewBackgroundImageDelegate {
    func setImageIndex(index: Int)
    func updateBackgroundImage(index: Int)
}

class STLoginViewController: UIViewController, LoginViewBackgroundImageDelegate {
    
    internal func updateBackgroundImage(index: Int) {
        if index >= 0 {
            self.loginView.backgroundImageView.image = self.bgImages[index]
        } else {
            self.loginView.backgroundImageView.image = self.bgImages[0]
        }
    }
    
    internal func setImageIndex(index: Int) {
        self.imageIndex = index
    }

    let loginView: STLoginView = {
        let loginView: STLoginView = STLoginView(frame: CGRect.zero)
        return loginView
    }()
    
    var delegate: MainViewBackgroundImageDelegate?
    let bgImages = [UIImage(named: "got.jpg"),UIImage(named: "twd.jpg"), UIImage(named: "sw"), UIImage(named: "avg.jpg"), UIImage(named: "hp"), UIImage(named: "bb"), UIImage(named: "hoc.jpg")]
    var imageIndex: Int = 0
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpViews()
        UIApplication.shared.statusBarStyle = .lightContent
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        let tapToDissmissKeyboard: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        view.addGestureRecognizer(tapToDissmissKeyboard)
    }
    
    override func viewWillAppear(_ animated: Bool) {
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
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    func setUpViews() {
        self.view.addSubview(loginView)
        loginView.snp.makeConstraints { (make) in
            make.top.equalTo(self.view.snp.top)
            make.bottom.equalTo(self.view.snp.bottom)
            make.leading.equalTo(self.view.snp.leading)
            make.trailing.equalTo(self.view.snp.trailing)
        }
        loginView.loginButton.addTarget(self, action:#selector(self.login), for: .touchUpInside)
        loginView.registerNavigateButton.addTarget(self, action:#selector(self.navigateToRegister), for: .touchUpInside)
        loginView.backButton.addTarget(self, action:#selector(self.navigateBack), for: .touchUpInside)
    }
    
    func login() {
        NSLog("%@", "login")
    }
    
    func navigateToRegister() {
        NSLog("%@", "register")
        let registerVC: STRegisterViewController = STRegisterViewController()
        registerVC.imageIndex = self.imageIndex
        registerVC.delegateLogin = self
        registerVC.registerView.backgroundImageView.image = self.loginView.backgroundImageView.image
        self.present(registerVC, animated: false, completion: nil)
    }
    
    func navigateBack() {
        delegate?.setImageIndex(index: self.imageIndex)
        delegate?.updateBackgroundImage(index: self.imageIndex - 1)
        self.dismiss(animated: false, completion: nil)
    }
    
    func keyboardWillShow(notification: NSNotification) {
        if self.loginView.loginButton.frame.origin.y + loginView.loginButton.frame.size.height + self.loginView.registerNavigateButton.frame.size.height/2 + 30 == 7 * self.view.frame.height/8 {
            let info = notification.userInfo!
            let keyboardFrame: CGRect = (info[UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
            UIView.animate(withDuration: 1.0, animations: {
                self.loginView.usernameField.frame.origin.y -= keyboardFrame.height / 3
                self.loginView.passwordField.frame.origin.y -= keyboardFrame.height / 3
                self.loginView.loginButton.frame.origin.y -= keyboardFrame.height / 3
            }, completion: nil)
        }
    }
    
    func keyboardWillHide(notification: NSNotification) {
        if self.loginView.loginButton.frame.origin.y + loginView.loginButton.frame.size.height + self.loginView.registerNavigateButton.frame.size.height/2 + 30 != 7 * self.view.frame.height/8 {
            let info = notification.userInfo!
            let keyboardFrame: CGRect = (info[UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
            UIView.animate(withDuration: 1.0, animations: {
                self.loginView.usernameField.frame.origin.y += keyboardFrame.height / 3
                self.loginView.passwordField.frame.origin.y += keyboardFrame.height / 3
                self.loginView.loginButton.frame.origin.y += keyboardFrame.height / 3
            }, completion: nil)
        }
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func changeBgImage() {
        UIView.animate(withDuration: 0.5, delay: 0.0, options: UIViewAnimationOptions.curveEaseOut, animations: {
            self.loginView.backgroundImageView.alpha = 0.0
        }, completion: { (finished: Bool) -> Void in
            UIView.animate(withDuration: 0.5, delay: 0.0, options: UIViewAnimationOptions.curveEaseIn, animations: {
                self.loginView.backgroundImageView.alpha = 0.5
                if self.imageIndex <  self.bgImages.count {
                    print("login \(self.imageIndex) ")
                    self.loginView.backgroundImageView.image = self.bgImages[self.imageIndex]
                    self.imageIndex += 1
                } else  if self.imageIndex == self.bgImages.count {
                    self.imageIndex = 0
                    self.loginView.backgroundImageView.image = self.bgImages[self.imageIndex]
                }
            }, completion:nil)
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
