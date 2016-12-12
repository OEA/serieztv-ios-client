//
//  Crew.swift
//  serieztv
//
//  Created by Goktug on 11/12/2016.
//  Copyright © 2016 serieztv. All rights reserved.
//

import Foundation

class Crew: NSObject {
    var name: String
    var image: String
    var birthday: Date
    var job: String
    var department: String
    var apiID: String
    var createdAt: Date
    var updatedAt: Date
    
    init(name: String, image: String, birthday: Date, job: String, department: String, apiID: String, createdAt: Date,
         updatedAt: Date) {
        self.name = name
        self.image = image
        self.birthday = birthday
        self.job = job
        self.department = department
        self.apiID = apiID
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
    
    
}
