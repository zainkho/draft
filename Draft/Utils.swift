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

func randomEmoji() -> String {
    let emojiStart = 0x1F601
    let ascii = emojiStart + Int(arc4random_uniform(UInt32(35)))
    let emoji = UnicodeScalar(ascii)?.description
    return emoji ?? "x"
}

extension UIColor {
    
    static let BREEZE = UIColor(red: 239/255, green: 246/255, blue: 255/255, alpha: 1.0)
    static let CLEAR = UIColor(red: 239/255, green: 246/255, blue: 255/255, alpha: 0)
    static let CREAM = UIColor(red: 255/255, green: 251/255, blue: 242/255, alpha: 1.0)
    static let SPACE = UIColor(red: 27/255, green: 31/255, blue: 35/255, alpha: 1.0)
    static let OCEAN = UIColor(red: 68/255, green: 77/255, blue: 86/255, alpha: 1.0)
    static let RAIN = UIColor(red: 162/255, green: 162/255, blue: 162/255, alpha: 1.0)
    static let CLOUD = UIColor(red: 250/255, green: 250/255, blue: 250/255, alpha: 1.0)
    
}

extension UIFont {
    static let TITLE = UIFont(name: "NewYorkMedium-Bold", size: 34)
    static let H1 = UIFont(name: "NewYorkMedium-Bold", size: 24)
    static let H2 = UIFont(name: "NewYorkMedium-Regular", size: 24)
    static let LABEL = UIFont(name: "NewYorkMedium-Bold", size: 17)
    static let BODY = UIFont(name: "NewYorkMedium-Regular", size: 16)
}