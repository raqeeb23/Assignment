//
//  DataModel.swift
//  Assignment
//
//  Created by Shaikh Rakib on 27/01/24.
//

import Foundation

struct ContentProfile: Codable {
    let image: URL
    let name: String
    let email: String
}

struct ContentMap: Codable {
    let title: String
    let pin: URL
    let lat: Double
    let lng: Double
}

struct ContentData: Codable {
    let title: String
    let source: String
    let value: String
}

struct UiItem: Decodable {
    let type: String
    let content: CodableContent
    
    private enum CodingKeys: String, CodingKey {
        case type
        case content
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        type = try container.decode(String.self, forKey: .type)

        switch type {
        case "profile":
            content = .profile(try container.decode(ContentProfile.self, forKey: .content))
        case "map":
            content =  .map(try container.decode(ContentMap.self, forKey: .content))
        case "data":
            content = .data(try container.decode(ContentData.self, forKey: .content))
        default:
            throw DecodingError.dataCorruptedError(forKey: .type, in: container, debugDescription: "Invalid type")
        }
    }
}

enum CodableContent: Decodable {
    case profile(ContentProfile)
    case map(ContentMap)
    case data(ContentData)

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        
        do {
            self = try .profile(container.decode(ContentProfile.self))
        } catch DecodingError.typeMismatch {
            // Not a Person, try decoding as Place
            do {
                self = try .map(container.decode(ContentMap.self))
            } catch DecodingError.typeMismatch {
                // Not a Place, try decoding as Event
                self = try .data(container.decode(ContentData.self))
            }
        }
    }

    private enum CodingKeys: String, CodingKey {
        case type
        case content
    }
}


