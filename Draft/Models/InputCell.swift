//
//  InputCell.swift
//  Draft
//
//  Created by Olivia on 11/19/19.
//

import Foundation

enum cellType {
    case input
    case button
}

class InputCell {
    var text: String!
    var type: cellType!
    
    init(text: String, type: cellType) {
        self.text = text
        self.type = type
    }
}
