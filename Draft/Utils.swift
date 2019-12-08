//
//  Utils.swift
//  Draft
//
//  Created by Zain Khoja on 11/20/19.
//

import UIKit

let SPACING_4: CGFloat = 4
let SPACING_6: CGFloat = 6
let SPACING_8: CGFloat = 8
let SPACING_12: CGFloat = 12
let SPACING_16: CGFloat = 16
let SPACING_24: CGFloat = 24
let SPACING_48: CGFloat = 48

let sampleAttractions = [
    "World Trade Center",
    "Statue of Liberty",
    "Central Park",
    "Washington Square Arch",
    "Empire State Building",
    "Times Square",
    "Bryant Park",
    "Radio City Music Hall",
    "The Vessel",
    "Chelsea Market"
]

let sampleRestaurants = [
    "Ichiran Ramen",
    "Black Seed Bagels",
    "Joe's Pizza",
    "Fat Witch Brownies",
    "Halal Guys",
    "Drunken Dumpling",
    "Los Tacos",
    "Abiko Curry",
    "Peter Luger's Steakhouse",
    "Boba Guys"
]

func randomEmoji() -> String {
    let emojiStart = 0x1F300
    let ascii = emojiStart + Int(arc4random_uniform(UInt32(13)))
    let emoji = UnicodeScalar(ascii)?.description
    return emoji ?? "x"
}

func randomAttraction(index: Int) -> String {
    return sampleAttractions[index % sampleAttractions.count]
}

func randomRestaurant(index: Int) -> String {
    return sampleRestaurants[index % sampleRestaurants.count]
}

extension UIColor {
    
    static let BREEZE = UIColor(red: 239/255, green: 246/255, blue: 255/255, alpha: 1.0)
    static let CLEAR = UIColor(red: 239/255, green: 246/255, blue: 255/255, alpha: 0)
    static let CREAM = UIColor(red: 255/255, green: 251/255, blue: 242/255, alpha: 1.0)
    static let CREAM_GRADIENT = UIColor(red: 255/255, green: 251/255, blue: 242/255, alpha: 0)
    static let SPACE = UIColor(red: 27/255, green: 31/255, blue: 35/255, alpha: 1.0)
    static let OCEAN = UIColor(red: 68/255, green: 77/255, blue: 86/255, alpha: 1.0)
    static let RAIN = UIColor(red: 162/255, green: 162/255, blue: 162/255, alpha: 1.0)
    static let CLOUD = UIColor(red: 250/255, green: 250/255, blue: 250/255, alpha: 1.0)
    static let DUSK = UIColor(red: 68/255, green: 77/255, blue: 86/255, alpha: 1.0)
    static let SKY = UIColor(red: 0/255, green: 112/255, blue: 255/255, alpha: 1.0)
    
}

extension UIFont {
    static let TITLE = UIFont(name: "NewYorkMedium-Bold", size: 34)
    static let H1 = UIFont(name: "NewYorkMedium-Bold", size: 24)
    static let H2 = UIFont(name: "NewYorkMedium-Regular", size: 24)
    static let LABEL = UIFont(name: "NewYorkMedium-Bold", size: 17)
    static let BODY = UIFont(name: "NewYorkMedium-Regular", size: 16)
}


let placeholderAttrs = [
    NSAttributedString.Key.foregroundColor: UIColor.RAIN,
    NSAttributedString.Key.font: UIFont.LABEL!
]

let labelAttrs = [
    NSAttributedString.Key.foregroundColor: UIColor.SPACE,
    NSAttributedString.Key.font: UIFont.LABEL!
]

func randomUserID(length: Int) -> String {
    let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    return String((0..<length).map{ _ in letters.randomElement()! })
}

func daysToEntries(days: [Day]) -> [[String:Any]] {
    
    var entries = [[String:Any]]()
    for day in days {
        for attraction in day.attractions {
            entries.append([
                "description": attraction,
                "kind": "attraction",
                "day_index": day.num
            ])
        }
        for restaurant in day.restaurants {
            entries.append([
                "description": restaurant,
                "kind": "restaurant",
                "day_index": day.num
            ])
        }
    }
    
    return entries
}

func convertBackendTrip(trip: Networking.Trip) -> Trip {
    var dayInfo = [Int: ([String], [String])]()
    for i in 0..<7 {
        dayInfo[i] = ([], [])
    }
    for entry in trip.entries {
        if entry.kind == "restaurant" {
            dayInfo[entry.dayIndex]?.0.append(entry.description)
        } else {
            dayInfo[entry.dayIndex]?.1.append(entry.description)
        }
    }
    var days = [Day]()
    dayInfo.forEach { (dayIndex, info) in
        if !info.0.isEmpty || !info.1.isEmpty {
            days.append(Day(num: dayIndex, attractions: info.1, restaurants: info.0))
        }
    }
    let newTrip = Trip(emoji: randomEmoji(), name: trip.name, location: trip.location ?? "", days: days)
    newTrip.id = trip.id
    return newTrip
}

func convertBackendTrips(trips: [Networking.Trip]) -> [Trip] {
    var convertedTrips = [Trip]()
    for trip in trips {
        let newTrip = convertBackendTrip(trip: trip)
        convertedTrips.append(newTrip)
    }
    return convertedTrips
}
