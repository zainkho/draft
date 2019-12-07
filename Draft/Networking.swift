//
//  Networking.swift
//  Draft
//
//  Created by William Ma on 11/19/19.
//

import Foundation
import Alamofire

final class Networking {

    enum Error: Swift.Error {

        case backendError(String)

        var localizedDescription: String {
            switch self {
            case .backendError(let error): return error
            }
        }
    }

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

    struct Trip: Codable {

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

    struct User: Codable {

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
    
    func getUser(forUser user: User, _ completion: @escaping (User) -> Void) {
        let user_id = user.id
        let userEndpoint = "https://draft-backend.duckdns.org/api/user/\(user_id)/"
        Alamofire.request(userEndpoint, method: .get).validate().responseData { response in
            switch response.result {
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                
                if let userData = try? jsonDecoder.decode(User.self, from: data) {
                    completion(userData)
                }
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func getTrips(forUser user: User, _ completion: @escaping ([Trip]) -> Void) {
        let user_id = user.id
        let userEndpoint = "https://draft-backend.duckdns.org/api/user/\(user_id)/"
        Alamofire.request(userEndpoint, method: .get).validate().responseData { response in
            switch response.result {
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                
                if let userData = try? jsonDecoder.decode(User.self, from: data) {
                    completion(userData.trips)
                }
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

    func createUser(userID: String, _ completion: @escaping (Int) -> Void) {
        let params = ["name": userID]
        let userEndpoint = "https://draft-backend.duckdns.org/api/users/"
        Alamofire.request(userEndpoint, method: .post, parameters: params, encoding: JSONEncoding.default).validate().responseData { response in
            switch response.result {
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                
                if let userData = try? jsonDecoder.decode(APIResponse<User>.self, from: data) {
                    completion(userData.data.id)
                }
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    private init() {
    }
    
}

