//
//  Trip.swift
//  Draft
//
//  Created by Olivia on 11/16/19.
//

import Foundation

class Trip {
    var emoji: String
    var name: String
    var location: String
    var len: Int
    var days: [Day]

    init(emoji: String, name: String, location: String, days: [Day] ) {
        self.emoji = emoji
        self.name = name
        self.location = location
        self.days = days
        self.len = self.days.count
    }
    
    func length() -> Int {
        return self.days.count
    }
}
