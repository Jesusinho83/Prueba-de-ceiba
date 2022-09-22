//
//  Posts.swift
//  preueba Ceiba
//
//  Created by Jesus Grimaldo on 17/09/22.
//

import Foundation
struct Posts1: Codable{
    var datas : Posts
}

struct Posts: Codable {
    let userID, id: Int
    let title, body: String

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, body
    }

    init(userID: Int, id: Int, title: String, body: String) {
        self.userID = userID
        self.id = id
        self.title = title
        self.body = body
    }
}

typealias Welcome = [Posts]
