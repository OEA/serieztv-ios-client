//
//  STMainViewController.swift
//  serieztv
//
//  Created by Goktug on 11/12/2016.
//  Copyright © 2016 serieztv. All rights reserved.
//

import UIKit

protocol MainViewBackgroundImageDelegate {
    func setImageIndex(index: Int)
    func updateBackgroundImage(index: Int)
}

class STMainViewController: UIViewController, MainViewBackgroundImageDelegate {

    let bgImages = [UIImage(named: "got.jpg"),UIImage(named: "twd.jpg"), UIImage(named: "sw"), UIImage(named: "avg.jpg"), UIImage(named: "hp"), UIImage(named: "bb"), UIImage(named: "hoc.jpg")]
    var imageIndex: Int = 0
    var timer = Timer()
    
    
    let mainView: STMainView = {
        let mainView: STMainView = STMainView(frame: CGRect.zero)
        return mainView
    }()
    
    internal func updateBackgroundImage(index: Int) {
        if index >= 0 {
            self.mainView.backgroundImageView.image = self.bgImages[index]
        } else {
            self.mainView.backgroundImageView.image = self.bgImages[0]
        }
    }
    
    internal func setImageIndex(index: Int) {
        self.imageIndex = index
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpViews()
        self.mainView.loginButton.alpha = 0.0
        self.mainView.registerButton.alpha = 0.0
        self.mainView.connectionOptionsLabel.alpha = 0.0
        self.mainView.connectWithFacebookButton.alpha = 0.0
        self.mainView.connectWithGoogleButton.alpha = 0.0
        self.mainView.connectWithTwitterButton.alpha = 0.0

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
    
    override func viewDidAppear(_ animated: Bool) {
        
        UIView.animate(withDuration: 0.75, delay: 0, options: .curveLinear, animations: {
            // this will change Y position of your imageView center
            // by 1 every time you press button
            self.mainView.logo.center.y = 100 + self.mainView.logo.frame.height/2
        }, completion: { (finished: Bool) -> Void in
            self.mainView.loginButton.alpha = 1.0
            self.mainView.registerButton.alpha = 1.0
            self.mainView.connectionOptionsLabel.alpha = 1.0
            self.mainView.connectWithFacebookButton.alpha = 1.0
            self.mainView.connectWithGoogleButton.alpha = 1.0
            self.mainView.connectWithTwitterButton.alpha = 1.0
        })
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.timer.invalidate()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setUpViews() {
        self.view.addSubview(mainView)
        mainView.snp.makeConstraints { (make) in
            make.top.equalTo(self.view.snp.top)
            make.bottom.equalTo(self.view.snp.bottom)
            make.leading.equalTo(self.view.snp.leading)
            make.trailing.equalTo(self.view.snp.trailing)
        }
        mainView.loginButton.addTarget(self, action:#selector(self.navigateToLogin), for: .touchUpInside)
        mainView.registerButton.addTarget(self, action:#selector(self.navigateToRegister), for: .touchUpInside)
        mainView.connectWithFacebookButton.addTarget(self, action:#selector(self.connectWithFacebook), for: .touchUpInside)
        mainView.connectWithTwitterButton.addTarget(self, action:#selector(self.connectWithTwitter), for: .touchUpInside)
        mainView.connectWithGoogleButton.addTarget(self, action:#selector(self.connectWithGoogle), for: .touchUpInside)
    }
    
    func navigateToLogin() {
        print("login")
        let loginVC: STLoginViewController = STLoginViewController()
        loginVC.imageIndex = self.imageIndex
        loginVC.delegate = self
        loginVC.loginView.backgroundImageView.image = self.mainView.backgroundImageView.image
        self.navigationController?.present(loginVC, animated: false, completion: nil)
    }
    
    func navigateToRegister() {
        print("register")
        let registerVC: STRegisterViewController = STRegisterViewController()
        registerVC.imageIndex = self.imageIndex
        registerVC.delegateMain = self
        registerVC.registerView.backgroundImageView.image = self.mainView.backgroundImageView.image
        self.navigationController?.present(registerVC, animated: false, completion: nil)
    }
    
    func connectWithFacebook() {
        print("facebook")
    }
    
    func connectWithTwitter() {
        print("twitter")
    }
    
    func connectWithGoogle() {
        print("google")
    }
    
    func changeBgImage() {
        UIView.animate(withDuration: 0.5, delay: 0.0, options: UIViewAnimationOptions.curveEaseOut, animations: {
            self.mainView.backgroundImageView.alpha = 0.0
        }, completion: { (finished: Bool) -> Void in
            UIView.animate(withDuration: 0.5, delay: 0.0, options: UIViewAnimationOptions.curveEaseIn, animations: {
                self.mainView.backgroundImageView.alpha = 0.5
                if self.imageIndex <  self.bgImages.count {
                    print("main \(self.imageIndex) ")
                    self.mainView.backgroundImageView.image = self.bgImages[self.imageIndex]
                    self.imageIndex += 1
                } else  if self.imageIndex == self.bgImages.count {
                    self.imageIndex = 0
                    self.mainView.backgroundImageView.image = self.bgImages[self.imageIndex]
                }
            }, completion:nil)
        })
    }

}
