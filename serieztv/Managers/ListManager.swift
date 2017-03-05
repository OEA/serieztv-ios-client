//
//  ListManager.swift
//  serieztv
//
//  Created by Goktug on 23/02/2017.
//  Copyright © 2017 serieztv. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class ListManager {
    var baseURL: String {
        get {
            return "http://localhost:3000/v1/userlist"
        }
    }
    
    var userListsUrl: String {
        get {
            return "\(baseURL)/userlists"
        }
    }
    
    var seriesListUrl: String {
        get {
            return "\(baseURL)/series"
        }
    }
    
    var moviesListUrl: String {
        get {
            return "\(baseURL)/movies"
        }
    }
    
    var allListUrl: String {
        get {
            return "\(baseURL)/all"
        }
    }
    
    var newListUrl: String {
        get {
            return "\(baseURL)/newlist"
        }
    }
    
    var removeListUrl: String {
        get {
            return "\(baseURL)/removelist/"
        }
    }
    
    var changeNameUrl: String {
        get {
            return "\(baseURL)/changename/"
        }
    }
    
    var changeStatusUrl: String {
        get {
            return "\(baseURL)/changestatus/"
        }
    }
    
    var addMovieUrl: String {
        get {
            return "\(baseURL)/addmovie"
        }
    }
    
    var addSeriesUrl: String {
        get {
            return "\(baseURL)/addseries/"
        }
    }
    
    var removeMovieUrl: String {
        get {
            return "\(baseURL)/removemovie/"
        }
    }
    
    var removeSeriesUrl: String {
        get {
            return "\(baseURL)/removeseries/"
        }
    }
    
    private init() {}
    
    class var sharedInstance: ListManager {
        struct Static {
            static let instance: ListManager = ListManager()
        }
        return Static.instance
    }
    
    func createList(userId: String, listName: String, isPrivate: Bool, completion: ((_ list: Userlist) -> ())?, errorCompletion: ((_ error: String) -> ())?) {
        
        Alamofire.request(self.newListUrl, method: .post, parameters: ["userId": userId, "listName": listName, "isPrivate": isPrivate])
            .responseJSON { response in
                if response.result.value != nil {
                    let json = JSON(response.result.value!)
                    if ( json["error"].string == nil) {
                        let userList: Userlist = Userlist()
                        userList.id = json["_id"].string!
                        userList.name = json["listName"].string!
                        userList.isPrivate = json["isPrivate"].bool!
                        completion?(userList)
                    } else {
                        errorCompletion?(json["error"].string!)
                    }
                } else {
                    errorCompletion?("Api is temporarly down")
                }
        }
    }
    
    func addMovie(list: Userlist, movieId: String, completion: ((_ list: Userlist) -> ())?, errorCompletion: ((_ error: String) -> ())?) {
        
        Alamofire.request(self.addMovieUrl, method: .post, parameters: ["id": list.id, "movieId": movieId])
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
                        list.movies = movieList
                        completion?(list)
                    } else {
                        errorCompletion?(json["error"].string!)
                    }
                } else {
                    errorCompletion?("Api is temporarly down")
                }
        }
    }
    
    func addSeries(list: Userlist, seriesId: String, completion: ((_ list: Userlist) -> ())?, errorCompletion: ((_ error: String) -> ())?) {
        
        Alamofire.request(self.addSeriesUrl, method: .post, parameters: ["id": list.id, "seriesId": seriesId])
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
                        list.seriesList = seriesList
                        completion?(list)
                    } else {
                        errorCompletion?(json["error"].string!)
                    }
                } else {
                    errorCompletion?("Api is temporarly down")
                }
        }
    }
    
    func getMovies(list: Userlist, completion: ((_ movies: [Movie]) -> ())?, errorCompletion: ((_ error: String) -> ())?) {
        let url = self.moviesListUrl+"?listId=\(list.id!)"
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
    
    func getSeries(list: Userlist, completion: ((_ movies: [Series]) -> ())?, errorCompletion: ((_ error: String) -> ())?) {
        let url = self.seriesListUrl+"?listId=\(list.id!)"
        print("url is \(url)")
        Alamofire.request(url, method: .get, parameters: nil)
            .responseJSON { response in
                if response.result.value != nil {
                    let json = JSON(response.result.value!)
                    if ( json["error"].string == nil) {
                        var seriesList = [Series]()
                        let jsonArray = json["series"].arrayValue
                        for data in jsonArray {
                            let movie: Series = SeriesManager.sharedInstance.parseSeries(data: data)
                            seriesList.append(movie)
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
    
    func getAllMedia(list: Userlist, completion: ((_ movies: [Movie], _ seriesList: [Series]) -> ())?, errorCompletion: ((_ error: String) -> ())?) {
        let url = self.allListUrl+"?listId=\(list.id!)"
        print("url is \(url)")
        Alamofire.request(url, method: .get, parameters: nil)
            .responseJSON { response in
                if response.result.value != nil {
                    let json = JSON(response.result.value!)
                    if ( json["error"].string == nil) {
                        var movieList = [Movie]()
                        let moviesArray = json["movies"].arrayValue
                        for data in moviesArray {
                            let movie: Movie = MovieManager.sharedInstance.parseMovie(data: data)
                            movieList.append(movie)
                        }
                        
                        var seriesList = [Series]()
                        let seriesArray = json["series"].arrayValue
                        for data in seriesArray {
                            let series: Series = SeriesManager.sharedInstance.parseSeries(data: data)
                            seriesList.append(series)
                        }
                        completion?(movieList, seriesList)
                    } else {
                        errorCompletion?(json["error"].string!)
                    }
                    
                } else {
                    errorCompletion?("Api is temporarly down")
                }
        }
    }
    
    func getUserlists(user: User, completion: ((_ lists: [Userlist]) -> ())?, errorCompletion: ((_ error: String) -> ())?) {
        let url = self.userListsUrl+"?userId=\(user.id!)"
        print("url is \(url)")
        Alamofire.request(url, method: .get, parameters: nil)
            .responseJSON { response in
                if response.result.value != nil {
                    let json = JSON(response.result.value!)
                    let jsonArray = json.arrayValue
                    print(jsonArray)
                    if ( json["error"].string == nil) {
                        var userlists = [Userlist]()
                        for data in jsonArray {
                            let list: Userlist = Userlist()
                            list.id = data["_id"].string!
                            list.name = data["listName"].string!
                            list.isPrivate = data["isPrivate"].bool!
                            userlists.append(list)
                        }
                        completion?(userlists)
                    } else {
                        errorCompletion?(json["error"].string!)
                    }
                    
                } else {
                    errorCompletion?("Api is temporarly down")
                }
        }
        
    }
    
    func removeList(userlist: Userlist, completion: ((_ list: Userlist) -> ())?, errorCompletion: ((_ error: String) -> ())?) {
        
        Alamofire.request(self.removeListUrl, method: .post, parameters: ["id": userlist.id])
            .responseJSON { response in
                if response.result.value != nil {
                    let json = JSON(response.result.value!)
                    if ( json["error"].string == nil) {
                        let userList: Userlist = Userlist()
                        userList.id = json["_id"].string!
                        userList.name = json["listName"].string!
                        userList.isPrivate = json["isPrivate"].bool!
                        completion?(userList)
                    } else {
                        errorCompletion?(json["error"].string!)
                    }
                } else {
                    errorCompletion?("Api is temporarly down")
                }
        }
    }
    
    func removeMovie(list: Userlist, movieId: String, completion: ((_ list: Userlist) -> ())?, errorCompletion: ((_ error: String) -> ())?) {
        
        Alamofire.request(self.removeMovieUrl, method: .post, parameters: ["id": list.id, "movieId": movieId])
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
                        list.movies = movieList
                        completion?(list)
                    } else {
                        errorCompletion?(json["error"].string!)
                    }
                } else {
                    errorCompletion?("Api is temporarly down")
                }
        }
    }
    
    func removeSeries(list: Userlist, seriesId: String, completion: ((_ list: Userlist) -> ())?, errorCompletion: ((_ error: String) -> ())?) {
        
        Alamofire.request(self.removeSeriesUrl, method: .post, parameters: ["id": list.id, "seriesId": seriesId])
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
                        list.seriesList = seriesList
                        completion?(list)
                    } else {
                        errorCompletion?(json["error"].string!)
                    }
                } else {
                    errorCompletion?("Api is temporarly down")
                }
        }
    }
    
    func changeListName(list: Userlist, newName: String, completion: ((_ list: Userlist) -> ())?, errorCompletion: ((_ error: String) -> ())?) {
        
        Alamofire.request(self.newListUrl, method: .post, parameters: ["id": list.id, "newName": newName])
            .responseJSON { response in
                if response.result.value != nil {
                    let json = JSON(response.result.value!)
                    if ( json["error"].string == nil) {
                        list.name = json["listName"].string!
                        completion?(list)
                    } else {
                        errorCompletion?(json["error"].string!)
                    }
                } else {
                    errorCompletion?("Api is temporarly down")
                }
        }
    }
    
    func changeListStatus(list: Userlist, newStatus: Bool, completion: ((_ list: Userlist) -> ())?, errorCompletion: ((_ error: String) -> ())?) {
        
        Alamofire.request(self.newListUrl, method: .put, parameters: ["id": list.id, "newStatus": newStatus])
            .responseJSON { response in
                if response.result.value != nil {
                    let json = JSON(response.result.value!)
                    if ( json["error"].string == nil) {
                        list.isPrivate = json["isPrivate"].boolValue
                        completion?(list)
                    } else {
                        errorCompletion?(json["error"].string!)
                    }
                } else {
                    errorCompletion?("Api is temporarly down")
                }
        }
    }
    
    
}
