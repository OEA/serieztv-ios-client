//
//  AuthManager.swift
//  serieztv
//
//  Created by Goktug on 15/12/2016.
//  Copyright © 2016 serieztv. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class AuthManager {
    
    private var baseURL: String {
        get {
            return "http://localhost:3000/v1/auth"
        }
    }
    
    private var registerUrl: String {
        get {
            return "\(baseURL)/register"
        }
    }
    
    private var loginUrl: String {
        get {
            return "\(baseURL)/login"
        }
    }
    
    private var getFollowersUrl: String {
        get {
            return "\(baseURL)/followers"
        }
    }
    
    private var getFollowingUrl: String {
        get {
            return "\(baseURL)/following"
        }
    }
    
    private var followMovieUrl: String {
        get {
            return "\(baseURL)/followmovie"
        }
    }
    
    private var unfollowMovieUrl: String {
        get {
            return "\(baseURL)/unfollowmovie"
        }
    }
    
    private var followSeriesUrl: String {
        get {
            return "\(baseURL)/followseries"
        }
    }
    
    private var unfollowSeriesUrl: String {
        get {
            return "\(baseURL)/unfollowseries"
        }
    }
    
    private var followUserUrl: String {
        get {
            return "\(baseURL)/followuser"
        }
    }
    
    private var unfollowUserUrl: String {
        get {
            return "\(baseURL)/unfollowuser"
        }
    }
    
    private var followedMoviesUrl: String {
        get {
            return "\(baseURL)/movies"
        }
    }
    
    private var followedSeriesUrl: String {
        get {
            return "\(baseURL)/series"
        }
    }
    
    
    private init() {}
    
    class var sharedInstance: AuthManager {
        struct Static {
            static let instance: AuthManager = AuthManager()
        }
        return Static.instance
    }
    
    func login(username: String, password: String, completion: ((_ user: User) -> ())?,
               errorCompletion: ((_ error: String) -> ())?) {
        
        Alamofire.request(self.loginUrl, method: .post, parameters: ["username": username, "password": password])
        .responseJSON { response in
            if response.result.value != nil {
                let json = JSON(response.result.value!)
                print(json)
                if ( json["error"].string == nil) {
                    let user: User = User()
                    user.id = json["_id"].string!
                    user.username = json["username"].string!
                    user.email = json["email"].string!
                    user.name = json["name"].string!
                    completion?(user)
                } else {
                    errorCompletion?(json["error"].string!)
                }
            } else {
                print(response)
                errorCompletion?("Api is temporarly down")
            }
        }
    }
    
    func register(email: String, username: String, password: String, name: String,
                  completion: ((_ user: User) -> ())?, errorCompletion: ((_ error: String) -> ())?) {
        Alamofire.request(self.registerUrl, method: .post,
                          parameters: ["username": username, "password": password, "name": name, "email": email])
            .responseJSON { response in
                
                if response.result.value != nil {
                    let json = JSON(response.result.value!)
                    print(json)
                    if ( json["error"].string == nil) {
                        let user: User = User()
                        user.id = json["_id"].string!
                        user.username = json["username"].string!
                        user.email = json["email"].string!
                        user.name = json["name"].string!
                        user.password = json["password"].string!
                        completion?(user)
                    } else {
                        errorCompletion?(json["error"].string!)
                    }
                    
                } else {
                    errorCompletion?("Api is temporarly down")
                }
        }
    }
    
    func followUser(userId: String, followedId: String, completion: ((_ user: User) -> ())?,
                    errorCompletion: ((_ error: String) -> ())?) {
        Alamofire.request(followUserUrl, method: .post, parameters: ["id": userId, "followedId": followedId])
            .responseJSON { response in
                if response.result.value != nil {
                    let json = JSON(response.result.value!)
                    if ( json["error"].string == nil) {
                        let user = User()
                        user.id = json["_id"].string!
                        user.username = json["username"].string!
                        user.email = json["email"].string!
                        user.name = json["name"].string!
                        user.password = json["password"].string!
                        
                        user.following = self.parseUsers(jsonArray: json["following"].array!)
                        user.followers = self.parseUsers(jsonArray: json["followers"].array!)
                        
                        user.followedMovies = self.parseMovies(json: json)
                        user.followedSeries = self.parseSeries(json: json)

                        completion?(user)
                        
                        
                    } else {
                        errorCompletion?(json["error"].string!)
                    }
                } else {
                    errorCompletion?("Api is temporarly down")
                }
        }
    }
    
    func parseUsers(jsonArray: [JSON]) -> [User] {
        var users = [User]()
        for data in jsonArray {
            let user = self.parseUser(data: data)
            users.append(user)
        }
        return users
    }
    
    func parseMovies(json: JSON) -> [Movie] {
        var followedMoviesArray = [Movie]()
        let followedMoviesJson = json["followedMovies"].array!
        for data in followedMoviesJson {
            let movie: Movie = MovieManager.sharedInstance.parseMovie(data: data)
            followedMoviesArray.append(movie)
        }
        return followedMoviesArray
    }
    
    func parseSeries(json: JSON) -> [Series] {
        var followedSeriesArray = [Series]()
        let followedSeriesJson = json["followedSeries"].array!
        for data in followedSeriesJson {
            let series: Series = SeriesManager.sharedInstance.parseSeries(data: data)
            followedSeriesArray.append(series)
        }
        return followedSeriesArray
    }
    
    func followMovie(userId: String, movieId: String, completion: ((_ user: User) -> ())?,
                     errorCompletion: ((_ error: String) -> ())?) {
        
        Alamofire.request(followUserUrl, method: .post, parameters: ["id": userId, "movieId": movieId])
            .responseJSON { response in
                if response.result.value != nil {
                    let json = JSON(response.result.value!)
                    if ( json["error"].string == nil) {
                        let user = User()
                        user.id = json["_id"].string!
                        user.username = json["username"].string!
                        user.email = json["email"].string!
                        user.name = json["name"].string!
                        user.password = json["password"].string!
                        
                        user.following = self.parseUsers(jsonArray: json["following"].array!)
                        user.followers = self.parseUsers(jsonArray: json["followers"].array!)
                        
                        user.followedMovies = self.parseMovies(json: json)
                        user.followedSeries = self.parseSeries(json: json)
                        
                        completion?(user)
                        
                        
                    } else {
                        errorCompletion?(json["error"].string!)
                    }
                } else {
                    errorCompletion?("Api is temporarly down")
                }
        }

        
    }
    
    func followSeries(userId: String, seriesId: String, completion: ((_ user: User) -> ())?,
                      errorCompletion: ((_ error: String) -> ())?) {
        Alamofire.request(followUserUrl, method: .post, parameters: ["id": userId, "seriesId": seriesId])
            .responseJSON { response in
                if response.result.value != nil {
                    let json = JSON(response.result.value!)
                    if ( json["error"].string == nil) {
                        let user = User()
                        user.id = json["_id"].string!
                        user.username = json["username"].string!
                        user.email = json["email"].string!
                        user.name = json["name"].string!
                        user.password = json["password"].string!
                        
                        user.following = self.parseUsers(jsonArray: json["following"].array!)
                        user.followers = self.parseUsers(jsonArray: json["followers"].array!)
                        
                        user.followedMovies = self.parseMovies(json: json)
                        user.followedSeries = self.parseSeries(json: json)
                        
                        completion?(user)
                        
                        
                    } else {
                        errorCompletion?(json["error"].string!)
                    }
                } else {
                    errorCompletion?("Api is temporarly down")
                }
        }

        
    }
    
    func unfollowUser(userId: String, followedId: String, completion: ((_ user: User) -> ())?,
                    errorCompletion: ((_ error: String) -> ())?) {
        Alamofire.request(followUserUrl, method: .post, parameters: ["id": userId, "followedId": followedId])
            .responseJSON { response in
                if response.result.value != nil {
                    let json = JSON(response.result.value!)
                    if ( json["error"].string == nil) {
                        let user = User()
                        user.id = json["_id"].string!
                        user.username = json["username"].string!
                        user.email = json["email"].string!
                        user.name = json["name"].string!
                        user.password = json["password"].string!
                        
                        user.following = self.parseUsers(jsonArray: json["following"].array!)
                        user.followers = self.parseUsers(jsonArray: json["followers"].array!)
                        
                        user.followedMovies = self.parseMovies(json: json)
                        user.followedSeries = self.parseSeries(json: json)
                        
                        completion?(user)
                        
                        
                    } else {
                        errorCompletion?(json["error"].string!)
                    }
                } else {
                    errorCompletion?("Api is temporarly down")
                }
        }

        
    }
    
    func unfollowMovie(userId: String, movieId: String, completion: ((_ user: User) -> ())?,
                     errorCompletion: ((_ error: String) -> ())?) {
        Alamofire.request(followUserUrl, method: .post, parameters: ["id": userId, "movieId": movieId])
            .responseJSON { response in
                if response.result.value != nil {
                    let json = JSON(response.result.value!)
                    if ( json["error"].string == nil) {
                        let user = User()
                        user.id = json["_id"].string!
                        user.username = json["username"].string!
                        user.email = json["email"].string!
                        user.name = json["name"].string!
                        user.password = json["password"].string!
                        
                        user.following = self.parseUsers(jsonArray: json["following"].array!)
                        user.followers = self.parseUsers(jsonArray: json["followers"].array!)
                        
                        user.followedMovies = self.parseMovies(json: json)
                        user.followedSeries = self.parseSeries(json: json)
                        
                        completion?(user)
                        
                        
                    } else {
                        errorCompletion?(json["error"].string!)
                    }
                } else {
                    errorCompletion?("Api is temporarly down")
                }
        }

        
    }
    
    func unfollowSeries(userId: String, seriesId: String, completion: ((_ user: User) -> ())?,
                      errorCompletion: ((_ error: String) -> ())?) {
        Alamofire.request(followUserUrl, method: .post, parameters: ["id": userId, "seriesId": seriesId])
            .responseJSON { response in
                if response.result.value != nil {
                    let json = JSON(response.result.value!)
                    if ( json["error"].string == nil) {
                        let user = User()
                        user.id = json["_id"].string!
                        user.username = json["username"].string!
                        user.email = json["email"].string!
                        user.name = json["name"].string!
                        user.password = json["password"].string!
                        
                        user.following = self.parseUsers(jsonArray: json["following"].array!)
                        user.followers = self.parseUsers(jsonArray: json["followers"].array!)
                        
                        user.followedMovies = self.parseMovies(json: json)
                        user.followedSeries = self.parseSeries(json: json)
                        
                        completion?(user)
                        
                        
                    } else {
                        errorCompletion?(json["error"].string!)
                    }
                } else {
                    errorCompletion?("Api is temporarly down")
                }
        }

        
    }
    
    func getFollowers(userId: String, completion: ((_ followers: [User]) -> ())?,
                    errorCompletion: ((_ error: String) -> ())?) {
        let url = getFollowersUrl+"?id=\(userId)"
        Alamofire.request(url, method: .get, parameters: nil)
            .responseJSON { response in
                if response.result.value != nil {
                    let json = JSON(response.result.value!)
                    if ( json["error"].string == nil) {
                        var followersArray = [User]()
                        let followersJson = json["followers"].array!
                        for data in followersJson{
                            let user = self.parseUser(data: data)
                            followersArray.append(user)
                        }
                        completion?(followersArray)
                    } else {
                        errorCompletion?(json["error"].string!)
                    }
                    
                } else {
                    errorCompletion?("Api is temporarly down")
                }
        }
        
    }
    
    func getFollowing(userId: String, completion: ((_ following: [User]) -> ())?,
                     errorCompletion: ((_ error: String) -> ())?) {
        let url = getFollowingUrl+"?id=\(userId)"
        Alamofire.request(url, method: .get, parameters: nil)
            .responseJSON { response in
                if response.result.value != nil {
                    let json = JSON(response.result.value!)
                    if ( json["error"].string == nil) {
                        var followingArray = [User]()
                        let followingJson = json["following"].array!
                        for data in followingJson {
                            let user = self.parseUser(data: data)
                            followingArray.append(user)
                        }
                        completion?(followingArray)
                    } else {
                        errorCompletion?(json["error"].string!)
                    }
                    
                } else {
                    errorCompletion?("Api is temporarly down")
                }
        }
        
    }
    
    func getMovies(userId: String, completion: ((_ movies: [Movie]) -> ())?,
                      errorCompletion: ((_ error: String) -> ())?) {
        let url = followedMoviesUrl+"?id=\(userId)"
        Alamofire.request(url, method: .get, parameters: nil)
            .responseJSON { response in
                if response.result.value != nil {
                    let json = JSON(response.result.value!)
                    if ( json["error"].string == nil) {
                        let followedMoviesArray = self.parseMovies(json: json)
                        completion?(followedMoviesArray)
                    } else {
                        errorCompletion?(json["error"].string!)
                    }
                    
                } else {
                    errorCompletion?("Api is temporarly down")
                }
        }

        
    }
    
    func getSeries(userId: String, completion: ((_ series: [Series]) -> ())?,
                      errorCompletion: ((_ error: String) -> ())?) {
        let url = followedSeriesUrl+"?id=\(userId)"
        Alamofire.request(url, method: .get, parameters: nil)
            .responseJSON { response in
                if response.result.value != nil {
                    let json = JSON(response.result.value!)
                    if ( json["error"].string == nil) {
                        let followedSeriesArray = self.parseSeries(json: json)
                        completion?(followedSeriesArray)
                    } else {
                        errorCompletion?(json["error"].string!)
                    }
                    
                } else {
                    errorCompletion?("Api is temporarly down")
                }
        }

        
    }
    
    func parseUser(data: JSON) -> User {
        let user = User()
        user.id = data["_id"].string!
        user.username = data["username"].string!
        user.email = data["email"].string!
        user.name = data["name"].string!
        user.password = data["password"].string!
        return user
    }
    
    
}
