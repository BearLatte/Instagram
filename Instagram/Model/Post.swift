//
//  Post.swift
//  Instagram
//
//  Created by Tim on 2023/7/20.
//

import Foundation
import Firebase

struct Post : Identifiable, Hashable, Codable {
    let id : String
    let ownerUid : String
    let caption : String
    var likes : Int
    let imageUrl : String
    let timestamp : Timestamp
    var user : User?
}


extension Post {
    static var MOCK_POSTS : [Post] = [
        .init(
            id: UUID().uuidString,
            ownerUid: UUID().uuidString,
            caption: "This is some test caption for now",
            likes: Int(arc4random()) % 100000,
            imageUrl: "batman",
            timestamp: Timestamp(),
            user: User.MOCK_USERS[0]
        ),
        .init(
            id: UUID().uuidString,
            ownerUid: UUID().uuidString,
            caption: "I’m Venom and you are mine.",
            likes: Int(arc4random()) % 100000,
            imageUrl: "venom-1",
            timestamp: Timestamp(),
            user: User.MOCK_USERS[1]
        ),
        .init(
            id: UUID().uuidString,
            ownerUid: UUID().uuidString,
            caption: "I am Iron-Man",
            likes: Int(arc4random()) % 100000,
            imageUrl: "ironman-1",
            timestamp: Timestamp(),
            user: User.MOCK_USERS[2]
        ),
        .init(
            id: UUID().uuidString,
            ownerUid: UUID().uuidString,
            caption: "Your friendly Neighborhood!",
            likes: Int(arc4random()) % 100000,
            imageUrl: "spider-man-1",
            timestamp: Timestamp(),
            user: User.MOCK_USERS[3]
        ),
        .init(
            id: UUID().uuidString,
            ownerUid: UUID().uuidString,
            caption: "Your friendly Neighborhood!",
            likes: Int(arc4random()) % 100000,
            imageUrl: "spider-man-2",
            timestamp: Timestamp(),
            user: User.MOCK_USERS[3]
        ),
        .init(
            id: UUID().uuidString,
            ownerUid: UUID().uuidString,
            caption: "I don't have an ordinary arrow. If I lose, I lose.",
            likes: Int(arc4random()) % 100000,
            imageUrl: "hawkeye-1",
            timestamp: Timestamp(),
            user: User.MOCK_USERS[4]
        ),
        .init(
            id: UUID().uuidString,
            ownerUid: UUID().uuidString,
            caption: "You always excelled, but not because you crave success, but because of you fear of failure.",
            likes: Int(arc4random()) % 100000,
            imageUrl: "doctor-stranger-1",
            timestamp: Timestamp(),
            user: User.MOCK_USERS[5]
        ),
        .init(
            id: UUID().uuidString,
            ownerUid: UUID().uuidString,
            caption: "Wakanda Forever",
            likes: Int(arc4random()) % 100000,
            imageUrl: "black-panther-1",
            timestamp: Timestamp(),
            user: User.MOCK_USERS[6]
        ),
        .init(
            id: UUID().uuidString,
            ownerUid: UUID().uuidString,
            caption: "Don’t let your past determine the future.",
            likes: Int(arc4random()) % 100000,
            imageUrl: "ant-man-1",
            timestamp: Timestamp(),
            user: User.MOCK_USERS[7]
        )
    ]
}
