//
//  User.swift
//  serieztv
//
//  Created by Goktug on 11/12/2016.
//  Copyright © 2016 serieztv. All rights reserved.
//

import Foundation

class User: NSObject {
    var name: String!
    
    var id: String!
    
    var username: String!
    
    var email: String!
    
    var password: String!
    
    var followers: [User]!
    
    var following: [User]!
    
    var followedMovies: [Movie]!
    
    var followedSeries: [Series]!
    

    override init() {
    }
}
