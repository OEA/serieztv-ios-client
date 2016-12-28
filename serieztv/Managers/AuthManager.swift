//
//  AuthManager.swift
//  serieztv
//
//  Created by Goktug on 15/12/2016.
//  Copyright © 2016 serieztv. All rights reserved.
//

import Foundation

class AuthManager {
    
    var baseURL: String {
        get {
            return ""
        }
    }
    
    private init() {}
    
    private let shared = AuthManager()
    
    func login(username: String, password: String, completion: (_ user: User) -> ()) {
        
    }
    
    func register(email: String, username: String, password: String, completion: (_ user: User) -> ()) {
        
    }
}
