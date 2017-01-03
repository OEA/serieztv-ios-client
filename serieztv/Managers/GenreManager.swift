//
//  GenreManager.swift
//  serieztv
//
//  Created by Omer on 03/01/2017.
//  Copyright © 2017 serieztv. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON


class GenreManager {
    var baseURL: String {
        get {
            return "http://localhost:3000/v1/genre"
        }
    }
    
    var listUrl: String {
        get {
            return "\(baseURL)/list"
        }
    }
    
    private init() {}
    
    class var sharedInstance: GenreManager {
        struct Static {
            static let instance: GenreManager = GenreManager()
        }
        return Static.instance
    }
    
    func getGenreList(withLimit: Int, completion: ((_ seriesList: [Genre]) -> ())?, errorCompletion: ((_ error: String) -> ())?) {
        self.getGenresFrom(url: self.listUrl, withLimit: "\(withLimit)", completion: completion, errorCompletion: errorCompletion)
    }
    
    
    func getGenresFrom(url: String, withLimit limit: String?, completion: ((_ seriesList: [Genre]) -> ())?, errorCompletion: ((_ error: String) -> ())?) {
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
                            
                            var genreList = [Genre]()
                            let jsonArray = json.arrayValue
                            for data in jsonArray {
                                let genre: Genre = self.parseGenre(data: data)
                                genreList.append(genre)
                            }
                            completion?(genreList)
                        }
                    } else {
                        errorCompletion?(json["error"].string!)
                    }
                } else {
                    errorCompletion?("Api is temporarly down")
                }
        }
    }
    
    func parseGenre(data: JSON) -> Genre {
        let genre: Genre = Genre()
        genre.name = data["name"].string
        genre.id = data["_id"].string
        return genre
    }
    
    
    
    
    
    
}
