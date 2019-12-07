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
    "Eiffel Tower",
    "Colosseum",
    "Great Wall of China",
    "Golden Gate Bridge",
    "Empire State Building",
    "Times Square",
    "Sydney Opera House",
    "Buckingham Palace",
    "Burj Khalifa",
    "Leaning Tower of Pisa"
]

let sampleRestaurants = [
    "Ichiran Ramen",
    "Din Tai Fung Dim Sum",
    "Gusteau's Restaurant",
    "Milk Bar",
    "Halal Guys",
    "BCD Tofu House",
    "Tiger Sugar Boba",
    "Abiko Curry",
    "Peter Luger's Steakhouse",
    "Udon Mugizo"
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


