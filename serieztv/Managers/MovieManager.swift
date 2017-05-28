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
    
    private var baseURL: String {
        get {
            return "http://localhost:3000/v1/movie"
        }
    }
    
    private var listUrl: String {
        get {
            return "\(baseURL)/list"
        }
    }
    
    private var topUrl: String {
        get {
            return "\(baseURL)/top"
        }
    }
    
    private var recentUrl: String {
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
    
    func findMovieWith(id: String, completion: ((_ movie: Movie) -> ())?, errorCompletion: ((_ error: String) -> ())?) {
        Alamofire.request("\(self.findUrl)/\(id)", method: .get, parameters: nil)
            .responseJSON { response in
                if response.result.value != nil {
                    let json = JSON(response.result.value!)
                    if ( json["error"].string == nil) {
                        if json != nil {
                            let jsonMovie = json
                            let movie: Movie = self.parseMovie(data: jsonMovie)
                            completion?(movie)
                        }
                    } else {
                        errorCompletion?(json["error"].string!)
                    }
                } else {
                    errorCompletion?("Api is temporarly down")
                }
        }
    }
    
    func searchForMovie(genre: String?, name: String?, completion: ((_ movies: [Movie]) -> ())?, errorCompletion: ((_ error: String) -> ())?) {
        var newUrl: String!
        if (name == nil && genre == nil) {
            newUrl = self.searchUrl
        } else if (name == nil && genre != nil){
            newUrl = "\(self.searchUrl)?genre=\(genre!)"
        } else if (name != nil && genre == nil) {
            newUrl = "\(self.searchUrl)?name=\(name!)"
        } else {
            newUrl = "\(self.searchUrl)?name=\(name!)&genre=\(genre!)"
        }
        Alamofire.request(newUrl!, method: .get, parameters: nil)
            .responseJSON { response in
                if response.result.value != nil {
                    let json = JSON(response.result.value!)
                    if ( json["error"].string == nil) {
                        if json != nil {
                            var movieList = [Movie]()
                            let jsonArray = json.arrayValue
                            for data in jsonArray {
                                let movie: Movie = self.parseMovie(data: data)
                                movieList.append(movie)
                            }
                            completion?(movieList)
                        }
                    } else {
                        errorCompletion?(json["error"].string!)
                    }
                } else {
                    errorCompletion?("Api is temporarly down")
                }
        }
        
    }
    
    func getRecentMovies(withLimit: Int, completion: ((_ movies: [Movie]) -> ())?, errorCompletion: ((_ error: String) -> ())?) {
        self.getMoviesFrom(url: self.recentUrl, withLimit: "\(withLimit)", completion: completion, errorCompletion: errorCompletion)
    }
    
    func getAllMovies(completion: ((_ movies: [Movie]) -> ())?, errorCompletion: ((_ error: String) -> ())?) {
        self.getMoviesFrom(url: self.listUrl, withLimit: nil, completion: completion, errorCompletion: errorCompletion)
    }
    
    func getTopMovies(withLimit: Int, completion: ((_ movies: [Movie]) -> ())?, errorCompletion: ((_ error: String) -> ())?) {
        self.getMoviesFrom(url: self.topUrl, withLimit: "\(withLimit)", completion: completion, errorCompletion: errorCompletion)
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
                        if json != nil {
                            var movieList = [Movie]()
                            let jsonArray = json.arrayValue
                            for data in jsonArray {
                                let movie: Movie = self.parseMovie(data: data)
                                movieList.append(movie)
                            }
                            completion?(movieList)
                        }
                    } else {
                        errorCompletion?(json["error"].string!)
                    }
                } else {
                    errorCompletion?("Api is temporarly down")
                }
        }
    }
    
    func parseMovie(data: JSON) -> Movie {
        let movie: Movie = Movie()
        movie.name = data["name"].string
        var characterList = [Character]()
        let charactersJSON = data["characters"].arrayValue
        for char in charactersJSON {
            let character: Character = self.parseCharacter(data: char)
            characterList.append(character)
        }
        movie.characters = characterList
        
        let genresJSON = data["genres"].arrayValue
        var genreList = [Genre]()
        
        for gen in genresJSON {
            let genre = parseGenre(data: gen)
            genreList.append(genre)
        }
        movie.genres = genreList
        movie.poster = data["poster"].string
        movie.image = data["image"].string
        movie.overview = data["overview"].string
        movie.status = data["status"].string
        movie.imdbScore = data["imdbRating"].double
        movie.imdbRating = data["imdbScore"].double
        movie.runtime = data["runtime"].double
        movie.airDate = data["airDate"].string
        movie.apiID = data["apiID"].string
        movie.id = data["id"].string
        movie.imdbId = data["imdbID"].string
        //                        var createdAt: Date!
        //                        var updatedAt: Date!
        return movie
    }
    
    func parseCharacter(data: JSON) -> Character {
        let character = Character()
        character.name = data["characterName"].string
        character.id = data["id"].string
        if data["characterImage"].string != nil {
            character.image = data["characterImage"].string
        }
        let characterStar = data["star"]
        let star = parseStar(data: characterStar)
        character.star = star
        return character
    }
    
    func parseStar(data: JSON) -> Star {
        let star = Star()
        star.name = data["name"].string
        star.id = data["id"].string
        if data["image"].string != nil {
            star.image = data["image"].string
        }
        star.active = data["active"].bool
        return star
    }
    
    func parseGenre(data: JSON) -> Genre {
        let genre = Genre()
        genre.name = data["name"].string
        genre.id = data["id"].string
        return genre
    }
}
