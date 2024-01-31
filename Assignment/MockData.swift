//
//  MockData.swift
//  Assignment
//
//  Created by Shaikh Rakib on 29/01/24.
//

import Foundation


let json = """
[
    {
        "type": "profile",
        "content": {
            "image": "https://some.server/profile_image_url.png",
            "name": "John Doe",
            "email": "john@domain.com"
        }
    },
    {
        "type": "map",
        "content": {
            "title": "Location",
            "pin": "https://some.server/map_pin_image_url.png",
            "lat": 1.2345,
            "lng": 1.2345
        }
    },
    {
        "type": "data",
        "content": {
            "title": "Information",
            "source": "wss://echo.websocket.org",
            "value": "Loading.."
        }
    }
]
""".data(using: .utf8)!
