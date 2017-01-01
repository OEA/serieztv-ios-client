//
//  STAboutViewController.swift
//  serieztv
//
//  Created by Goktug on 31/12/2016.
//  Copyright © 2016 serieztv. All rights reserved.
//

import UIKit

class STAboutViewController: UIViewController {
    
    let aboutView: STAboutView = {
        let aboutView = STAboutView()
        return aboutView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(aboutView)
        aboutView.snp.makeConstraints { (make) in
            make.leading.trailing.top.bottom.equalTo(0)
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
