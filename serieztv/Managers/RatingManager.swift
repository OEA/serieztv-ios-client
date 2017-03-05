//
//  RatingManager.swift
//  serieztv
//
//  Created by Goktug on 23/02/2017.
//  Copyright © 2017 serieztv. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class RatingManager {
    
    var baseURL: String {
        get {
            return "http://localhost:3000/v1/rating"
        }
    }
    
    var newRatingUrl: String {
        get {
            return "\(baseURL)/newrating"
        }
    }
    
    var removeRatingUrl: String {
        get {
            return "\(baseURL)/removerating/"
        }
    }
    
    var updateRatingUrl: String {
        get {
            return "\(baseURL)/updaterating"
        }
    }
    
    var ratedMoviesUrl: String {
        get {
            return "\(baseURL)/ratedmoviesof/"
        }
    }
    
    var ratedSeriesUrl: String {
        get {
            return "\(baseURL)/ratedseriesof"
        }
    }
    
    var seriesRateUrl: String {
        get {
            return "\(baseURL)/getrateforseries/"
        }
    }
    
    var movieRateUrl: String {
        get {
            return "\(baseURL)/getrateformovies"
        }
    }
    
    var mostRatedMoviesUrl: String {
        get {
            return "\(baseURL)/mostratedmovies/"
        }
    }
    
    var mostRatedSeriesUrl: String {
        get {
            return "\(baseURL)/mostratedseries"
        }
    }
    
    var mostRatedMoviesOfUserUrl: String {
        get {
            return "\(baseURL)/mostratedmoviesofuser/"
        }
    }
    
    var mostRatedSeriesOfUserUrl: String {
        get {
            return "\(baseURL)/mostratedseriesofuser/"
        }
    }
    
    private init() {}
    
    class var sharedInstance: RatingManager {
        struct Static {
            static let instance: RatingManager = RatingManager()
        }
        return Static.instance
    }
}
