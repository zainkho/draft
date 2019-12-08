//
//  Entry.swift
//  Draft
//
//  Created by Zain Khoja on 12/7/19.
//

import Foundation

struct Entry: Codable {

    let id: Int
    let description: String
    let dayIndex: Int

    let kind: String?
    let completed: Bool

    init(id: Int, description: String, dayIndex: Int, kind: String?, completed: Bool) {
        self.id = id
        self.description = description
        self.dayIndex = dayIndex
        self.kind = kind
        self.completed = completed
    }

    init?(json: [String: Any]) {
        guard let id = json["id"] as? Int,
            let description = json["description"] as? String,
            let dayIndex = json["day_index"] as? Int else {
                return nil
        }

        self.id = id
        self.description = description
        self.dayIndex = dayIndex

        self.kind = json["kind"] as? String
        self.completed = json["completed"] as? Bool ?? false
    }

}
