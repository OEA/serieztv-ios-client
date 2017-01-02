//
//  Episode.swift
//  serieztv
//
//  Created by Goktug on 11/12/2016.
//  Copyright © 2016 serieztv. All rights reserved.
//

import Foundation

class Episode: NSObject {
    var name: String!
  //  var crew: [Crew]
  //  var guestStars: [Star]!
    var number: Int!
    var overview: String!
//    var imdbScore: Double!
//    var imdbRating: Double!
    var createdAt: String!
    var updatedAt: String!
    var apiID: String!
    var id: String!
    
    override init() {
    }
}
