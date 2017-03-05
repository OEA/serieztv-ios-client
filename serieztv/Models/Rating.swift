//
//  Rating.swift
//  serieztv
//
//  Created by Goktug on 26/02/2017.
//  Copyright © 2017 serieztv. All rights reserved.
//

import Foundation

class Rating: NSObject {
    var rating: Double!
    var user: User!
    var movie: Movie!
    var series: Series!
    var id: String!

    
    override init() {
        
    }
}
