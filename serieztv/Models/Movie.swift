//
//  Movie.swift
//  serieztv
//
//  Created by Goktug on 11/12/2016.
//  Copyright © 2016 serieztv. All rights reserved.
//

import Foundation

class Movie: NSObject {
    var name: String
    var stars: [Star]
    var genres: [Genre]
    var overview: String
    var status: String
    var poster: String
    var image: String
    var imdbScore: Double
    var imdbRating: Double
    var runtime: Double
    var airDate: Date
    var createdAt: Date
    var updatedAt: Date
    var apiID: String
    
    init(name: String, stars: [Star], genres: [Genre], overview: String, status: String, poster: String, image: String,
         imdbScore: Double, imdbRating: Double, runtime: Double, airDate: Date, createdAt: Date, updatedAt: Date,
         apiID: String) {
        self.name = name
        self.stars = stars
        self.genres = genres
        self.overview = overview
        self.status = status
        self.poster = poster
        self.image = image
        self.imdbScore = imdbScore
        self.imdbRating = imdbRating
        self.runtime = runtime
        self.airDate = airDate
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.apiID = apiID
    }
}
