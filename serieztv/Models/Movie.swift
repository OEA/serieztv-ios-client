//
//  Movie.swift
//  serieztv
//
//  Created by Goktug on 11/12/2016.
//  Copyright © 2016 serieztv. All rights reserved.
//

import Foundation

class Movie: NSObject {
    var name: String!
    var characters: [Character]!
    var genres: [Genre]!
    var overview: String!
    var status: String!
    var poster: String!
    var image: String!
    var imdbScore: Double!
    var imdbRating: Double!
    var runtime: Double!
    var airDate: String!
    var createdAt: String!
    var updatedAt: String!
    var apiID: String!
    var id: String!
    var imdbId: String!
    
    override init() {

    }
}
