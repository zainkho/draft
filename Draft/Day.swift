//
//  Day.swift
//  Draft
//
//  Created by Olivia on 11/18/19.
//

import Foundation

class Day {
    var num: Int
    var emoji: String
    var attractions: [String]
    var restaurants: [String]
    
    init(num: Int, emoji: String, attractions: [String], restaurants: [String] ) {
        self.num = num
        self.emoji = emoji
        self.attractions = attractions
        self.restaurants = restaurants
    }
}
