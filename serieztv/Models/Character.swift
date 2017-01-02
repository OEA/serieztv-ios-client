//
//  Character.swift
//  serieztv
//
//  Created by Goktug on 11/12/2016.
//  Copyright © 2016 serieztv. All rights reserved.
//

import Foundation

class Character: NSObject {
    var star: Star!
    var name: String!
    var image: String!
    var apiID: String!
    var createdAt: Date!
    var updatedAt: Date!
    
    override init() {
    }
}
