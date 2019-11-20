//
//  Networking.swift
//  Draft
//
//  Created by William Ma on 11/19/19.
//

import Foundation

final class Networking {

    struct Entry {

        let id: Int
        let description: String
        let kind: String
        let dayIndex: Int

        init?(json: [String: Any]) {
            guard let id = json["id"] as? Int,
                let description = json["description"] as? String,
                let kind = json["kind"] as? String,
                let dayIndex = json["day_index"] as? Int else {
                    return nil
            }

            self.id = id
            self.description = description
            self.kind = kind
            self.dayIndex = dayIndex
        }

    }

    struct Trip {

        let id: Int
        let name: String
        let entries: [Entry]

        init?(json: [String: Any]) {
            guard let id = json["id"] as? Int,
                let name = json["name"] as? String,
                let entriesData = json["entries"] as? [[String: Any]] else {
                    return nil
            }

            self.id = id
            self.name = name
            self.entries = entriesData.compactMap(Entry.init)
        }

    }

    struct User {

        let id: Int
        let name: String
        let trips: [Trip]

        init?(json: [String: Any]) {
            guard let id = json["id"] as? Int,
                let name = json["name"] as? String,
                let tripsData = json["trips"] as? [[String: Any]] else {
                    return nil
            }

            self.id = id
            self.name = name
            self.trips = tripsData.compactMap(Trip.init)
        }

    }

    static let shared = Networking()

    func getUsers(_ completion: @escaping ([User]) -> Void) {
        guard let usersUrl = URL(string: "http://localhost:5000/api/users/") else {
            completion([])
            return
        }

        let task = URLSession.shared.dataTask(with: usersUrl) { (data, response, error) in
            guard let data = data, error == nil else {
                print(error)
                return
            }

            let results = String(data: data, encoding: .utf8)
            let response = try! JSONSerialization.jsonObject(with: data) as! [String: Any]
            let users = (response["data"] as! [[String: Any]]).compactMap(User.init)
            print(users)
        }

        task.resume()
    }

    init() {
    }

}
