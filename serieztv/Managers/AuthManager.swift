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
    
    private var baseURL: String {
        get {
            return "http://localhost:3000/v1/auth"
        }
    }
    
    private var registerUrl: String {
        get {
            return "\(baseURL)/register"
        }
    }
    
    private var loginUrl: String {
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
    
    func login(username: String, password: String, completion: ((_ user: User) -> ())?, errorCompletion: ((_ error: String) -> ())?) {
        
        Alamofire.request(self.loginUrl, method: .post, parameters: ["username": username, "password": password])
        .responseJSON { response in
            if response.result.value != nil {
                let json = JSON(response.result.value!)
                print(json)
                if ( json["error"].string == nil) {
                    let user: User = User()
                    user.id = json["_id"].string!
                    user.username = json["username"].string!
                    user.email = json["email"].string!
                    user.name = json["name"].string!
                    completion?(user)
                } else {
                    errorCompletion?(json["error"].string!)
                }
            } else {
                errorCompletion?("Api is temporarly down")
            }
        }
    }
    
    func register(email: String, username: String, password: String, name: String, completion: ((_ user: User) -> ())?, errorCompletion: ((_ error: String) -> ())?) {
        Alamofire.request(self.registerUrl, method: .post, parameters: ["username": username, "password": password, "name": name, "email": email])
            .responseJSON { response in
                
                if response.result.value != nil {
                    let json = JSON(response.result.value!)
                    print(json)
                    if ( json["error"].string == nil) {
                        let user: User = User()
                        user.id = json["_id"].string!
                        user.username = json["username"].string!
                        user.email = json["email"].string!
                        user.name = json["name"].string!
                        user.password = json["password"].string!
                        completion?(user)
                    } else {
                        errorCompletion?(json["error"].string!)
                    }
                    
                } else {
                    errorCompletion?("Api is temporarly down")
                }
        }
    }
}
