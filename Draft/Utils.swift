//
//  Utils.swift
//  Draft
//
//  Created by Zain Khoja on 11/20/19.
//

import Foundation

func randomEmoji() -> String {
    let emojiStart = 0x1F601
    let ascii = emojiStart + Int(arc4random_uniform(UInt32(35)))
    let emoji = UnicodeScalar(ascii)?.description
    return emoji ?? "x"
}
