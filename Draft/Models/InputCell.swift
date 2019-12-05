//
//  InputCell.swift
//  Draft
//
//  Created by Olivia on 11/19/19.
//

import Foundation

enum cellType: String {
    case input
    case aButton
    case rButton
}

class InputCell: CustomDebugStringConvertible {
    var text: String!
    var type: cellType!
    
    init(text: String, type: cellType) {
        self.text = text
        self.type = type
    }
    
    var debugDescription: String {
        return "text: \(text!), type: \(type!.rawValue)"
    }
}
