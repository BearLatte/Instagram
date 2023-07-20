//
//  User.swift
//  Instagram
//
//  Created by Tim on 2023/7/20.
//

import Foundation


struct User : Identifiable, Codable, Hashable {
    let id: String
    var userName : String
    var profileImageUrl : String?
    var fullName : String?
    var bio : String?
    let email : String
}


extension User {
    static var MOCK_USERS : [User] = [
        .init(
            id: UUID().uuidString,
            userName: "batman",
            profileImageUrl: "batman-2",
            fullName: "Bruce Wayne",
            bio: "Gotham's dark Knight",
            email: "batman@gmail.com"
        ),
        .init(
            id: UUID().uuidString,
            userName: "venom",
            profileImageUrl: "venom-2",
            fullName: "Dddie Brook",
            bio: "Venom",
            email: "venom@gmail.com"
        ),
        .init(
            id: UUID().uuidString,
            userName: "ironman",
            profileImageUrl: "ironman-2",
            fullName: "Tony Stark",
            bio: "ironman",
            email: "ironman@gmail.com"
        ),
        .init(
            id: UUID().uuidString,
            userName: "spider-man",
            profileImageUrl: "spider-man-2",
            fullName: "Peter Benjamin Parker",
            bio: "spider-man",
            email: "spider-man@gmail.com"
        ),
        .init(
            id: UUID().uuidString,
            userName: "hawkeye",
            profileImageUrl: "hawkeye-2",
            fullName: "Clint Barton",
            bio: "hawkeye",
            email: "hawkeye@gmail.com"
        ),
        .init(
            id: UUID().uuidString,
            userName: "doctor-stranger",
            profileImageUrl: "doctor-stranger-2",
            fullName: "Stephen Vincent Strange",
            bio: "doctor-stranger",
            email: "doctor-stranger@gmail.com"
        ),
        .init(
            id: UUID().uuidString,
            userName: "black-panther",
            profileImageUrl: "black-panther-2",
            fullName: "T'Challa",
            bio: "Wakanda Forever",
            email: "black-panther@gmail.com"
        ),
        .init(
            id: UUID().uuidString,
            userName: "ant-man",
            profileImageUrl: "ant-man-2",
            fullName: "Scott Lang",
            bio: "ant-man",
            email: "ant-man@gmail.com"
        )
    ]
}
