//
//  SeriesManager.swift
//  serieztv
//
//  Created by Goktug on 02/01/2017.
//  Copyright © 2017 serieztv. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class SeriesManager {
    
    var baseURL: String {
        get {
            return "http://localhost:3000/v1/series"
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
    
    private init() {}
    
    class var sharedInstance: SeriesManager {
        struct Static {
            static let instance: SeriesManager = SeriesManager()
        }
        return Static.instance
    }
    
    
    func findSeriesWith(id: String, completion: ((_ series: Series) -> ())?, errorCompletion: ((_ error: String) -> ())?) {
        Alamofire.request("\(self.findUrl)/\(id)", method: .get, parameters: nil)
            .responseJSON { response in
                if response.result.value != nil {
                    let json = JSON(response.result.value!)
                    if ( json["error"].string == nil) {
                        if json != nil {
                            let jsonSeries = json
                            let series: Series = self.parseSeries(data: jsonSeries)
                            completion?(series)
                        }
                    } else {
                        errorCompletion?(json["error"].string!)
                    }
                } else {
                    errorCompletion?("Api is temporarly down")
                }
        }
    }
    
    func searchForSeries(genre: String?, name: String?, completion: ((_ seriesList: [Series]) -> ())?, errorCompletion: ((_ error: String) -> ())?) {
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
                            var seriesList = [Series]()
                            let jsonArray = json.arrayValue
                            for data in jsonArray {
                                let series: Series = self.parseSeries(data: data)
                                seriesList.append(series)
                            }
                            completion?(seriesList)
                        }
                    } else {
                        errorCompletion?(json["error"].string!)
                    }
                } else {
                    errorCompletion?("Api is temporarly down")
                }
        }
        
    }
    
    func getRecentSeriesList(withLimit: Int, completion: ((_ seriesList: [Series]) -> ())?, errorCompletion: ((_ error: String) -> ())?) {
        self.getSeriesFrom(url: self.recentUrl, withLimit: "\(withLimit)", completion: completion, errorCompletion: errorCompletion)
    }
    
    func getAllSeriesList(completion: ((_ seriesList: [Series]) -> ())?, errorCompletion: ((_ error: String) -> ())?) {
        self.getSeriesFrom(url: self.listUrl, withLimit: nil, completion: completion, errorCompletion: errorCompletion)
    }
    
    func getTopSeriesList(withLimit: Int, completion: ((_ seriesList: [Series]) -> ())?, errorCompletion: ((_ error: String) -> ())?) {
        self.getSeriesFrom(url: self.topUrl, withLimit: "\(withLimit)", completion: completion, errorCompletion: errorCompletion)
    }
    
    
    func getSeriesFrom(url: String, withLimit limit: String?, completion: ((_ seriesList: [Series]) -> ())?, errorCompletion: ((_ error: String) -> ())?) {
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
                            var seriesList = [Series]()
                            let jsonArray = json.arrayValue
                            for data in jsonArray {
                                let series: Series = self.parseSeries(data: data)
                                seriesList.append(series)
                            }
                            completion?(seriesList)
                        }
                    } else {
                        errorCompletion?(json["error"].string!)
                    }
                } else {
                    errorCompletion?("Api is temporarly down")
                }
        }
    }
    
    func parseSeries(data: JSON) -> Series{
        let series: Series = Series()
        series.name = data["name"].string
        var characterList = [Character]()
        let charactersJSON = data["characters"].arrayValue
        for char in charactersJSON {
            let character: Character = self.parseCharacter(data: char)
            characterList.append(character)
        }
        series.characters = characterList
        
        let genresJSON = data["genres"].arrayValue
        var genreList = [Genre]()
        
        for gen in genresJSON {
            let genre = parseGenre(data: gen)
            genreList.append(genre)
        }
        series.genres = genreList
        
        let seasonsJSON = data["seasons"].arrayValue
        var seasons = [Season]()
        
        for sea in seasonsJSON {
            let season: Season = parseSeason(data: sea)
            seasons.append(season)
        }
        series.seasons = seasons
        
        series.poster = data["poster"].string
        series.image = data["image"].string
        series.overview = data["overview"].string
        series.status = data["status"].string
        series.imdbScore = data["imdbRating"].double
        series.imdbRating = data["imdbScore"].double
        series.runtime = data["runtime"].double
        series.firstAir = data["firstAir"].string
        series.id = data["id"].string
        series.active = data["active"].bool
        series.imdbId = data["imdbID"].string
        //                        var createdAt: Date!
        //                        var updatedAt: Date!
        return series
    }
    
    func parseCharacter(data: JSON) -> Character {
        let character = Character()
        character.name = data["characterName"].string!
        character.id = data["id"].string!
        if data["characterImage"].string != nil {
            character.image = data["characterImage"].string!
        }
        let characterStar = data["star"]
        let star = parseStar(data: characterStar)
        character.star = star
        return character
    }
    
    func parseStar(data: JSON) -> Star {
        let star = Star()
        star.name = data["name"].string!
        if data["image"].string != nil {
            star.image = data["image"].string!
        }
        star.active = data["active"].bool!
        star.id = data["id"].string!
        return star
    }
    
    func parseGenre(data: JSON) -> Genre {
        let genre = Genre()
        genre.name = data["name"].string!
        genre.apiID = data["id"].string!
        return genre
    }
    
    func parseSeason(data: JSON) -> Season {
        let season = Season()
        season.name = data["name"].string
        season.airDate = data["airDate"].string
        season.id = data["id"].string!
        season.poster = data["poster"].string!
        season.number = data["number"].int!
        season.overview = data["overview"].string!
        
        var episodes = [Episode]()
        let episodesJSON = data["episodes"].arrayValue
        for eps in episodesJSON {
            let episode: Episode = self.parseEpisode(data: eps)
            episodes.append(episode)
        }
        season.episodes = episodes
        return season
    }
    
    func parseEpisode(data: JSON) -> Episode {
        let episode = Episode()
        episode.name = data["name"].string!
        episode.id = data["id"].string!
        episode.number = data["number"].int!
        episode.overview = data["overview"].string!
        return episode
    }
    
}
