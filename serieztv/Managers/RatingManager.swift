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
            //return "http://52.90.67.168:3000/v1/rating"
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
    
    func rate(user: User, movieId: String?, seriesId: String?, rating: Double, completion: ((_ rated: Rating) -> ())?, errorCompletion: ((_ error: String) -> ())?) {
        var id = ""
        var params: [String:Any] = [:]
        if movieId != nil {
            id = movieId!
            params = ["userId": user.id, "movie": id, "rating": rating]
        } else {
            id = seriesId!
            params = ["userId": user.id, "series": id, "rating": rating]
        }
        
        Alamofire.request(self.newRatingUrl, method: .post, parameters: params)
            .responseJSON { response in
                if response.result.value != nil {
                    let json = JSON(response.result.value!)
                    if ( json["error"].string == nil) {
                        let rating: Rating = Rating()
                        rating.id = json["_id"].string!
                        rating.rating = json["rating"].double!
                        if movieId != nil {
                            rating.movie = MovieManager.sharedInstance.parseMovie(data: json["movie"])
                        } else {
                            rating.series = SeriesManager.sharedInstance.parseSeries(data: json["series"])
                        }
                        rating.user = user
                        completion?(rating)
                    } else {
                        errorCompletion?(json["error"].string!)
                    }
                } else {
                    errorCompletion?("Api is temporarly down")
                }
        }
    }
    
    func updateRating(rating: Rating, newRating: Double, completion: ((_ rated: Rating) -> ())?, errorCompletion: ((_ error: String) -> ())?) {
        Alamofire.request(self.updateRatingUrl, method: .put, parameters: ["id": rating.id, "newRating": newRating])
            .responseJSON { response in
                if response.result.value != nil {
                    let json = JSON(response.result.value!)
                    if ( json["error"].string == nil) {
                        rating.rating = json["rating"].double!
                        completion?(rating)
                    } else {
                        errorCompletion?(json["error"].string!)
                    }
                } else {
                    errorCompletion?("Api is temporarly down")
                }
        }
    }
    
    func getRatedMovies(userId: String, completion: ((_ movies: [Movie]) -> ())?, errorCompletion: ((_ error: String) -> ())?) {
        let url = self.ratedMoviesUrl+"?userId=\(userId)"
        print("url is \(url)")
        Alamofire.request(url, method: .get, parameters: nil)
            .responseJSON { response in
                if response.result.value != nil {
                    let json = JSON(response.result.value!)
                    if ( json["error"].string == nil) {
                        var movieList = [Movie]()
                        let jsonArray = json["movies"].arrayValue
                        for data in jsonArray {
                            let movie: Movie = MovieManager.sharedInstance.parseMovie(data: data)
                            movieList.append(movie)
                        }
                        completion?(movieList)
                    } else {
                        errorCompletion?(json["error"].string!)
                    }
                    
                } else {
                    errorCompletion?("Api is temporarly down")
                }
        }
    }
    
    func getRatedSeries(userId: String, completion: ((_ seriesList: [Series]) -> ())?, errorCompletion: ((_ error: String) -> ())?) {
        let url = self.ratedMoviesUrl+"?userId=\(userId)"
        print("url is \(url)")
        Alamofire.request(url, method: .get, parameters: nil)
            .responseJSON { response in
                if response.result.value != nil {
                    let json = JSON(response.result.value!)
                    if ( json["error"].string == nil) {
                        var seriesList = [Series]()
                        let jsonArray = json["series"].arrayValue
                        for data in jsonArray {
                            let series: Series = SeriesManager.sharedInstance.parseSeries(data: data)
                            seriesList.append(series)
                        }
                        completion?(seriesList)
                    } else {
                        errorCompletion?(json["error"].string!)
                    }
                    
                } else {
                    errorCompletion?("Api is temporarly down")
                }
        }
    }
    
    func getRateOfMovieForUser(user: User, movie: Movie, completion: ((_ rated: Rating) -> ())?, errorCompletion: ((_ error: String) -> ())?) {
        let url = self.movieRateUrl+"?userId=\(user.id!)&movieId=\(movie.id!)"
        print("url is \(url)")
        Alamofire.request(url, method: .get, parameters: nil)
            .responseJSON { response in
                if response.result.value != nil {
                    let json = JSON(response.result.value!)
                    if ( json["error"].string == nil) {
                        let rating = Rating()
                        let rate = json["rating"].double!
                        let id = json["id"].string!
                        rating.rating = rate
                        rating.id = id
                        rating.movie = movie
                        rating.user = user
                        completion?(rating)
                    } else {
                        errorCompletion?(json["error"].string!)
                    }
                    
                } else {
                    errorCompletion?("Api is temporarly down")
                }
        }
    }
    
    func getRateOfSeriesForUser(user: User, series: Series, completion: ((_ rated: Rating) -> ())?, errorCompletion: ((_ error: String) -> ())?) {
        let url = self.seriesRateUrl+"?userId=\(user.id!)&seriesId=\(series.id!)"
        print("url is \(url)")
        Alamofire.request(url, method: .get, parameters: nil)
            .responseJSON { response in
                if response.result.value != nil {
                    let json = JSON(response.result.value!)
                    if ( json["error"].string == nil) {
                        let rating = Rating()
                        let rate = json["rating"].double!
                        let id = json["id"].string!
                        rating.rating = rate
                        rating.id = id
                        rating.series = series
                        rating.user = user
                        completion?(rating)
                    } else {
                        errorCompletion?(json["error"].string!)
                    }
                    
                } else {
                    errorCompletion?("Api is temporarly down")
                }
        }
    }
}
