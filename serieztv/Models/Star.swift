//
//  Star.swift
//  serieztv
//
//  Created by Goktug on 11/12/2016.
//  Copyright © 2016 serieztv. All rights reserved.
//

import Foundation

class Star: NSObject {
    var name: String
    var image: String
    var birthday: Date
    var createdAt: Date
    var updatedAt: Date
    var active: Bool
    var apiID: String
    
    init(name: String, image: String, birthday: Date, createdAt: Date, updatedAt: Date, active: Bool, apiID: String) {
        self.name = name
        self.image = image
        self.birthday = birthday
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.active = active
        self.apiID = apiID
    }
    
}
