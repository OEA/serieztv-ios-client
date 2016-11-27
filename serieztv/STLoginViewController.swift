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
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
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
    
    
}
