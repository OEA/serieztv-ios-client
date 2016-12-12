//
//  Genre.swift
//  serieztv
//
//  Created by Goktug on 11/12/2016.
//  Copyright © 2016 serieztv. All rights reserved.
//

import Foundation

class Genre: NSObject {
    var name: String
    var apiID: String
    var createdAt: Date
    var updatedAt: Date
    
    init(name: String, apiID: String, createdAt: Date, updatedAt: Date) {
        self.name = name
        self.apiID = apiID
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
}
