//
//  MovieManager.swift
//  serieztv
//
//  Created by Goktug on 02/01/2017.
//  Copyright © 2017 serieztv. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class MovieManager: NSObject {
    
    var baseURL: String {
        get {
            return "http://localhost:3000/v1/movie"
        }
    }
    
    var listUrl: String {
        get {
            return "\(baseURL)/list"
        }
    }
    
    var topUrl: String {
        get {
            return "\(baseURL)/top"
        }
    }
    
    var recentUrl: String {
        get {
            return "\(baseURL)/recent"
        }
    }
    
    private var searchUrl: String {
        get {
            return "\(baseURL)/search"
        }
    }
    
    private var findUrl: String {
        get {
            return "\(baseURL)/find"
        }
    }
    
    private override init() {}
    
    class var sharedInstance: MovieManager {
        struct Static {
            static let instance: MovieManager = MovieManager()
        }
        return Static.instance
    }
    
    func getMoviesFrom(url: String, withLimit limit: String?, completion: ((_ movies: [Movie]) -> ())?, errorCompletion: ((_ error: String) -> ())?) {
        var limitedUrl: String!
        if (limit == nil) {
            limitedUrl = url
        } else {
            limitedUrl = "\(url)?limit=\(limit!)"
        }
        Alamofire.request(limitedUrl, method: .get, parameters: nil)
            .responseJSON { response in
                if response.result.value != nil {
                    let json = JSON(response.result.value!)
                    if ( json["error"].string == nil) {
                        var movieList = [Movie]()
                        let jsonArray = json.arrayValue
                        for data in jsonArray {
                            let movie: Movie = Movie()
                            movie.name = data["name"].string!
                            let charactersJSON = data["characters"].arrayValue
                            var characterList = [Character]()
                            for char in charactersJSON {
                                let character = Character()
                                character.name = char["characterName"].string!
                                if char["characterImage"].string != nil {
                                    character.image = char["characterImage"].string!
                                }
                                let star = Star()
                                let characterStar = char["star"]
                                star.name = characterStar["name"].string!
                                if characterStar["image"].string != nil {
                                    star.image = characterStar["image"].string!
                                }
                                character.star = star
                                characterList.append(character)
                            }
                            movie.characters = characterList
                            
                            let genresJSON = data["genres"].arrayValue
                            var genreList = [Genre]()
                            
                            for gen in genresJSON {
                                let genre = Genre()
                                genre.name = gen["name"].string!
                                genre.apiID = gen["id"].string!
                                genreList.append(genre)
                            }
                            movie.genres = genreList
                            movie.poster = data["poster"].string!
                            movie.image = data["image"].string!
                            movie.overview = data["overview"].string!
                            movie.status = data["status"].string!
                            movie.imdbScore = data["imdbScore"].double!
                            movie.imdbRating = data["imdbRating"].double!
                            movie.runtime = data["runtime"].double!
                            movie.airDate = data["airDate"].string!
                            movie.apiID = data["apiID"].string!
                            movieList.append(movie)
                        }
                        completion?(movieList)
                        //                        var characters: [Character]!
                        //                        var genres: [Genre]!
                        //                        var createdAt: Date!
                        //                        var updatedAt: Date!
                    } else {
                        errorCompletion?(json["error"].string!)
                    }
                    
                } else {
                    errorCompletion?("Api is temporarly down")
                }
        }
    }
    
    
    
    
    func getTopMovies(completion: ((_ movies: [Movie]) -> ())?, errorCompletion: ((_ error: String) -> ())?) {
        Alamofire.request(self.topUrl, method: .get, parameters: nil)
            .responseJSON { response in
                if response.result.value != nil {
                    let json = JSON(response.result.value!)
                    if ( json["error"].string == nil) {
                        var movieList = [Movie]()
                        let jsonArray = json.arrayValue
                        for data in jsonArray {
                            let movie: Movie = Movie()
                            movie.name = data["name"].string!
                            let charactersJSON = data["characters"].arrayValue
                            var characterList = [Character]()
                            for char in charactersJSON {
                                let character = Character()
                                character.name = char["characterName"].string!
                                if char["characterImage"].string != nil {
                                    character.image = char["characterImage"].string!
                                }
                                let star = Star()
                                let characterStar = char["star"]
                                star.name = characterStar["name"].string!
                                if characterStar["image"].string != nil {
                                    star.image = characterStar["image"].string!
                                }
                                character.star = star
                                characterList.append(character)
                            }
                            movie.characters = characterList
                            
                            let genresJSON = data["genres"].arrayValue
                            var genreList = [Genre]()
                            
                            for gen in genresJSON {
                                let genre = Genre()
                                genre.name = gen["name"].string!
                                genre.apiID = gen["id"].string!
                                genreList.append(genre)
                            }
                            movie.genres = genreList
                            movie.poster = data["poster"].string!
                            movie.image = data["image"].string!
                            movie.overview = data["overview"].string!
                            movie.status = data["status"].string!
                            movie.imdbScore = data["imdbScore"].double!
                            movie.imdbRating = data["imdbRating"].double!
                            movie.runtime = data["runtime"].double!
                            movie.airDate = data["airDate"].string!
                            movie.apiID = data["apiID"].string!
                            movieList.append(movie)
                        }
                        completion?(movieList)
//                        var characters: [Character]!
//                        var genres: [Genre]!
//                        var createdAt: Date!
//                        var updatedAt: Date!
                    } else {
                        errorCompletion?(json["error"].string!)
                    }
                    
                } else {
                    errorCompletion?("Api is temporarly down")
                }
        }
    }
    

}
