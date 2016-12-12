//
//  Season.swift
//  serieztv
//
//  Created by Goktug on 11/12/2016.
//  Copyright © 2016 serieztv. All rights reserved.
//

import Foundation

class Season: NSObject {
    var name: String
    var number: Int
    var poster: String
    var series: Series
    var overview: String
    var airDate: Date
    var createdAt: Date
    var updatedAt: Date
    var apiID: String
    
    init(name: String, number: Int, poster: String, series: Series, overview: String, airDate: Date, createdAt: Date,
        updatedAt: Date, apiID: String) {
        self.name = name
        self.number = number
        self.poster = poster
        self.series = series
        self.overview = overview
        self.airDate = airDate
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.apiID = apiID
    }
}
