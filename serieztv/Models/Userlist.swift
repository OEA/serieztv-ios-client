//
//  Userlist.swift
//  serieztv
//
//  Created by Goktug on 26/02/2017.
//  Copyright © 2017 serieztv. All rights reserved.
//

import Foundation

class Userlist: NSObject {
    var name: String!
    var seriesList: [Series]!
    var user: User!
    var isPrivate: Bool!
    var movies: [Movie]!
    var id: String!
    
    override init() {
        
    }
}
