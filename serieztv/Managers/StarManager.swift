//
//  StarManager.swift
//  serieztv
//
//  Created by Omer on 03/01/2017.
//  Copyright © 2017 serieztv. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON


class StarManager {
    var baseURL: String {
        get {
            return "http://localhost:3000/v1/star"
        }
    }
    
    var listUrl: String {
        get {
            return "\(baseURL)/list"
        }
    }
    
    var detailUrl: String {
        get {
            return "\(baseURL)/detail/"
        }
    }
    
    private init() {}
    
    class var sharedInstance: StarManager {
        struct Static {
            static let instance: StarManager = StarManager()
        }
        return Static.instance
    }
    
        
    func getStarList(completion: ((_ seriesList: [Star]) -> ())?, errorCompletion: ((_ error: String) -> ())?) {
        self.getStarsFrom(url: self.listUrl, completion: completion, errorCompletion: errorCompletion)
    }
    
    func getStarDetail(id: String, completion: ((_ seriesList: [Series], _ movieList: [Movie]) -> ())?, errorCompletion: ((_ error: String) -> ())?) {
        let detailUrl = self.detailUrl + id
        Alamofire.request(detailUrl, method: .get, parameters: nil)
            .responseJSON { response in
                if response.result.value != nil {
                    let json = JSON(response.result.value!)
                    
                    if ( json["error"].string == nil) {
                        if json != nil {
                            
                            var seriesList = [Series]()
                            var movieList = [Movie]()
                            let moviesArray = json["movies"].arrayValue
                            let seriesArray = json["series"].arrayValue
                            for data in moviesArray {
                                let movie: Movie = MovieManager.sharedInstance.parseMovie(data: data)
                                movieList.append(movie)
                            }
                            for data in seriesArray {
                                let series: Series = SeriesManager.sharedInstance.parseSeries(data: data)
                                seriesList.append(series)
                            }
                            completion?(seriesList, movieList)
                        }
                    } else {
                        errorCompletion?(json["error"].string!)
                    }
                } else {
                    errorCompletion?("Api is temporarly down")
                }
        }
    }
    
    func getStarsFrom(url: String, completion: ((_ starList: [Star]) -> ())?, errorCompletion: ((_ error: String) -> ())?) {

        Alamofire.request(listUrl, method: .get, parameters: nil)
            .responseJSON { response in
                if response.result.value != nil {
                    let json = JSON(response.result.value!)
                    
                    if ( json["error"].string == nil) {
                        if json != nil {
                            
                            var starList = [Star]()
                            let jsonArray = json.arrayValue
                            for data in jsonArray {
                                let star: Star = self.parseStar(data: data)
                                starList.append(star)
                            }
                            completion?(starList)
                        }
                    } else {
                        errorCompletion?(json["error"].string!)
                    }
                } else {
                    errorCompletion?("Api is temporarly down")
                }
        }
    }
    
    func parseStar(data: JSON) -> Star {
        let star: Star = Star()
        star.name = data["name"].string
        star.id = data["_id"].string
        return star
    }
    
    
    
    
    
    
    
    
}
