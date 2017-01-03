//
//  SearchManager.swift
//  serieztv
//
//  Created by Omer on 03/01/2017.
//  Copyright © 2017 serieztv. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON


class SearchManager {
    var searchUrl: String {
        get {
            return "http://localhost:3000/v1/search"
        }
    }
    
    private init() {}
    
    class var sharedInstance: SearchManager {
        struct Static {
            static let instance: SearchManager = SearchManager()
        }
        return Static.instance
    }
    
    func query(query: String, completion: ((_ genreList: [Genre], _ movieList: [Movie], _ seriesList: [Series], _ starList: [Star]) -> ())?, errorCompletion: ((_ error: String) -> ())?) {
        var url: String = "\(self.searchUrl)?query=\(query)"
        Alamofire.request(url, method: .get, parameters: nil)
            .responseJSON { response in
                if response.result.value != nil {
                    let json = JSON(response.result.value!)
                    
                    if ( json["error"].string == nil) {
                        if json != nil {
                            
                            var genreList = [Genre]()
                            var seriesList = [Series]()
                            var movieList = [Movie]()
                            var starList = [Star]()
                            let moviesArray = json["movies"].arrayValue
                            let seriesArray = json["series"].arrayValue
                            let genresArray = json["genres"].arrayValue
                            let starsArray = json["stars"].arrayValue
                            for data in moviesArray {
                                let movie: Movie = MovieManager.sharedInstance.parseMovie(data: data)
                                movieList.append(movie)
                            }
                            for data in seriesArray {
                                let series: Series = SeriesManager.sharedInstance.parseSeries(data: data)
                                seriesList.append(series)
                            }
                            for data in genresArray {
                                let series: Genre = GenreManager.sharedInstance.parseGenre(data: data)
                                genreList.append(series)
                            }
                            for data in starsArray {
                                let star: Star = SeriesManager.sharedInstance.parseStar(data: data)
                                starList.append(star)
                            }
                            completion?(genreList, movieList, seriesList, starList)
                        }
                    } else {
                        errorCompletion?(json["error"].string!)
                    }
                } else {
                    errorCompletion?("Api is temporarly down")
                }
        }
    }

    
    
    
    
    
    
}
