//
//  Character.swift
//  serieztv
//
//  Created by Goktug on 11/12/2016.
//  Copyright © 2016 serieztv. All rights reserved.
//

import Foundation

class Character: NSObject {
    var star: Star
    var name: String
    var image: String
    var apiID: String
    var createdAt: Date
    var updatedAt: Date
    
    init(star: Star, name: String, image: String, apiID: String, createdAt: Date, updatedAt: Date) {
        self.star = star
        self.name = name
        self.image = image
        self.apiID = apiID
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
}
