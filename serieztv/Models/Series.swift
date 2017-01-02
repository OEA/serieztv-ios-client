//
//  Series.swift
//  serieztv
//
//  Created by Goktug on 11/12/2016.
//  Copyright © 2016 serieztv. All rights reserved.
//

import Foundation

class Series: NSObject {
    var name: String!
    var characters: [Character]!
    var genres: [Genre]!
    var seasons: [Season]!
    var overview: String!
    var status: String!
    var poster: String!
    var image: String!
    var imdbScore: Double!
    var imdbRating: Double!
    var imdbId: String!
    var runtime: Double!
    var firstAir: String!
    var active: Bool!
    var createdAt: String!
    var updatedAt: String!
    var id: String!
    
    override init() {
    }
}
