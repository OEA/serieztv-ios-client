//
//  Episode.swift
//  serieztv
//
//  Created by Goktug on 11/12/2016.
//  Copyright © 2016 serieztv. All rights reserved.
//

import Foundation

class Episode: NSObject {
    var name: String
    var crew: [Crew]
    var guestStars: [Star]
    var season: Season
    var overview: String
    var imdbScore: Double
    var imdbRating: Double
    var createdAt: Date
    var updatedAt: Date
    var apiID: String
    
    init(name: String, crew: [Crew], guestStars: [Star], season: Season, overview: String, imdbScore: Double,
         imdbRating: Double, createdAt: Date, updatedAt: Date, apiID: String) {
        self.name = name
        self.crew = crew
        self.guestStars = guestStars
        self.season = season
        self.overview = overview
        self.imdbScore = imdbScore
        self.imdbRating = imdbRating
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.apiID = apiID
    }
}
