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
    var length: Int
    var days: [Day]
    
    init(emoji: String, name: String, location: String, length: Int, days: [Day] ) {
        self.emoji = emoji
        self.name = name
        self.location = location
        self.length = length
        self.days = days
    }
}
