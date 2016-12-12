//
//  Comment.swift
//  serieztv
//
//  Created by Goktug on 11/12/2016.
//  Copyright © 2016 serieztv. All rights reserved.
//

import Foundation

class Comment: NSObject {
    var user: User
    var comment: String
    var type: Movie
    var active: Bool
    var apiID: String
    var createdAt: Date
    var updatedAt: Date
    
    init(user: User, comment: String, type: Movie, active: Bool, apiID: String, createdAt: Date, updatedAt: Date) {
        self.user = user
        self.comment = comment
        self.type = type
        self.active = active
        self.apiID = apiID
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
}
