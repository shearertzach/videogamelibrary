//
//  Game.swift
//  VideoGameLibrary
//
//  Created by Zach Shearer on 9/4/18.
//  Copyright © 2018 Zach Shearer. All rights reserved.
//

import Foundation


class Game {
    var title: String
    var checkedIn = true
    var dueDate: Date?
    var rating: String
    
    
    init(title: String, rating: String) {
        self.title = title
        self.rating = rating
    }
    
}






























