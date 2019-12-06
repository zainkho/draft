//
//  TripViewCellModel.swift
//  Draft
//
//  Created by Olivia on 12/5/19.
//

import Foundation

enum tripCellType: String {
    case heading
    case normal
}

class TripViewCellModel {
    var text: String!
    var type: tripCellType!
    var image: String?
    
    init(text: String, type: tripCellType, img: String?) {
        self.text = text
        self.type = type
        if let i = img {
            self.image = i
        }
    }
}
