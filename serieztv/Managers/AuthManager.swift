//
//  AuthManager.swift
//  serieztv
//
//  Created by Goktug on 15/12/2016.
//  Copyright © 2016 serieztv. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class AuthManager {
    
    var baseURL: String {
        get {
            return "http://localhost:3000/v1/auth"
        }
    }
    
    var registerUrl: String {
        get {
            return "\(baseURL)/register"
        }
    }
    
    var loginUrl: String {
        get {
            return "\(baseURL)/login"
        }
    }
    
    private init() {}
    
    class var sharedInstance: AuthManager {
        struct Static {
            static let instance: AuthManager = AuthManager()
        }
        return Static.instance
    }
    
    func login(username: String, password: String, completion: ((_ user: User) -> ())?) {
        
        Alamofire.request(self.loginUrl, method: .post, parameters: ["username": username, "password": password])
        .responseJSON { response in
            if response.result.value != nil {
                
                
                let json = JSON(response.result.value!)
                
                let user: User = User()
                user.username = json["username"].string
                user.apiKey = json["apikey"].string
                user.email = json["email"].string
                user.id = json["userId"].numberValue
                user.userId = json["_id"].string
                self.loggedInUser = user
                
            } else {
                status(status: false, user: nil)
            }
        }
        
        
    }
    
    func register(email: String, username: String, password: String, completion: (_ user: User) -> ()) {
        
    }
}
