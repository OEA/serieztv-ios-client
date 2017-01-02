//
//  Season.swift
//  serieztv
//
//  Created by Goktug on 11/12/2016.
//  Copyright © 2016 serieztv. All rights reserved.
//

import Foundation

class Season: NSObject {
    var name: String!
    var number: Int!
    var poster: String!
    var episodes: [Episode]!
    var overview: String!
    var airDate: String!
    var createdAt: String!
    var updatedAt: String!
    var apiID: String!
    var id: String!
    
    override init() {
    }
}
