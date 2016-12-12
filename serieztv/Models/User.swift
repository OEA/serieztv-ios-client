//
//  User.swift
//  serieztv
//
//  Created by Goktug on 11/12/2016.
//  Copyright © 2016 serieztv. All rights reserved.
//

import Foundation

class User: NSObject {
    var name: String
    var username: String
    var password: String
    var activated: Bool
    var activation: Bool
    var forgotten: Bool
    var createdAt: Date
    var updatedAt: Date
    
    init(name: String, username: String, password: String, activated: Bool, activation: Bool, forgotten:Bool,
                  createdAt: Date, updatedAt: Date) {
        self.name = name
        self.username = username
        self.password = password
        self.activated = activated
        self.activation = activation
        self.forgotten = forgotten
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
}
