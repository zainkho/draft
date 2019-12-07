//
//  Networking.swift
//  Draft
//
//  Created by William Ma on 11/19/19.
//

import Foundation

final class Networking {

    enum Error: Swift.Error {

        case backendError(String)

        var localizedDescription: String {
            switch self {
            case .backendError(let error): return error
            }
        }
    }

    struct Entry {

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

    struct Trip {

        let id: Int
        let name: String
        let entries: [Entry]

        let location: String?
        let imageUrl: URL?
        let imageCredits: String?

        init(id: Int, name: String, entries: [Entry], location: String) {
            self.id = id
            self.name = name
            self.entries = entries
            self.location = location
            self.imageUrl = nil
            self.imageCredits = nil
        }

        init?(json: [String: Any]) {
            guard let id = json["id"] as? Int,
                let name = json["name"] as? String,
                let entriesData = json["entries"] as? [[String: Any]] else {
                    return nil
            }

            self.id = id
            self.name = name
            self.entries = entriesData.compactMap(Entry.init)

            self.location = json["location"] as? String
            self.imageUrl = (json["image_url"] as? String).flatMap { URL(string: $0) }
            self.imageCredits = json["image_credits"] as? String
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

    func getUsers(_ completion: @escaping (Result<[User], Swift.Error>) -> Void) {
        guard let usersUrl = URL(string: "https://draft-backend.duckdns.org/api/users/") else {
            completion(.success([]))
            return
        }

        let task = URLSession.shared.dataTask(with: usersUrl) { (data, response, error) in
            guard let data = data, error == nil else {
                completion(error.map { .failure($0) } ?? .success([]))
                return
            }

            do {
                guard let response = try JSONSerialization.jsonObject(with: data) as? [String: Any] else {
                    completion(.success([]))
                    return
                }

                if let success = response["success"] as? Bool, success,
                    let usersArray = response["data"] as? [[String: Any]] {
                    completion(.success(usersArray.compactMap(User.init)))
                } else if let error = response["error"] as? String {
                    completion(.failure(Error.backendError(error)))
                }
            } catch {
                completion(.failure(error))
            }
        }

        task.resume()
    }

    private init() {
    }

}

