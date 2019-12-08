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
    var url: String
    var id: Int?

    init(emoji: String, name: String, location: String, days: [Day]) {
        self.emoji = emoji
        self.name = name
        self.location = location
        self.days = days
        self.len = self.days.count
        self.url = "https://images.unsplash.com/photo-1535726917010-060104716686?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max&ixid=eyJhcHBfaWQiOjEwMjY4OH0"
    }
    
    func length() -> Int {
        return self.days.count
    }
}
