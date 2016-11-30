//
//  STLoginViewController.swift
//  serieztv
//
//  Created by Goktug on 27/11/2016.
//  Copyright © 2016 serieztv. All rights reserved.
//

import UIKit
import SnapKit

class STLoginViewController: UIViewController {
    
    let loginView: STLoginView = {
        let loginView: STLoginView = STLoginView(frame: CGRect.zero)
        return loginView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpViews()
        UIApplication.shared.statusBarStyle = .lightContent
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    func keyboardWillShow(notification: NSNotification) {
        if self.loginView.loginButton.frame.origin.y + loginView.loginButton.frame.size.height/2 == self.view.frame.height/2 {
            UIView.animate(withDuration: 1.0, animations: {
                self.loginView.emailField.frame.origin.y -= 40
                self.loginView.passwordField.frame.origin.y -= 40
                self.loginView.loginButton.frame.origin.y -= 40
                self.loginView.logo.frame.origin.y -= 40
            }, completion: nil)
        }
    }
    
    func keyboardWillHide(notification: NSNotification) {
        if self.loginView.loginButton.frame.origin.y + loginView.loginButton.frame.size.height/2 != self.view.frame.height/2 {
            UIView.animate(withDuration: 1.0, animations: {
                self.loginView.emailField.frame.origin.y += 40
                self.loginView.passwordField.frame.origin.y += 40
                self.loginView.loginButton.frame.origin.y += 40
                self.loginView.logo.frame.origin.y += 40
            }, completion: nil)
        }
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
        
    }
    
    func login() {
        NSLog("%@", "login")
    }
    
    func navigateToRegister() {
        NSLog("%@", "register")
        let registerVC: STRegisterViewController = STRegisterViewController()
        self.navigationController?.pushViewController(registerVC, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {
        addBottomBorderToTextField(textField: self.loginView.emailField)
        addBottomBorderToTextField(textField: self.loginView.passwordField)
    }
    
    func addBottomBorderToTextField(textField: UITextField) {
        let border = CALayer()
        let width = CGFloat(0.5)
        border.borderColor = UIColor(colorLiteralRed: 233/255, green: 228/255, blue: 222/255, alpha: 1.0).cgColor
        border.frame = CGRect(x: 0, y: textField.frame.size.height - width, width:  textField.frame.size.width, height: textField.frame.size.height)
        
        border.borderWidth = width
        textField.layer.addSublayer(border)
        textField.layer.masksToBounds = true
    }
    
}
