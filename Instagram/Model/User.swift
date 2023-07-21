//
//  User.swift
//  Instagram
//
//  Created by Tim on 2023/7/20.
//

import Foundation
import Firebase


struct User : Identifiable, Codable, Hashable {
    let id: String
    var userName : String
    var profileImageUrl : String?
    var fullName : String?
    var bio : String?
    let email : String
    
    var isCurrentUser : Bool {
        guard let currentUserUid = Auth.auth().currentUser?.uid else {
            return false
        }
        
        return id == currentUserUid
    }
}


extension User {
    static var MOCK_USERS : [User] = [
        .init(
            id: UUID().uuidString,
            userName: "Bat-Man",
            profileImageUrl: "batman-2",
            fullName: "Bruce Wayne",
            bio: "Gotham's dark Knight",
            email: "batman@gmail.com"
        ),
        .init(
            id: UUID().uuidString,
            userName: "Venom",
            profileImageUrl: "venom-2",
            fullName: "Dddie Brook",
            bio: "Venom",
            email: "venom@gmail.com"
        ),
        .init(
            id: UUID().uuidString,
            userName: "Iron-Man",
            profileImageUrl: "ironman-2",
            fullName: "Tony Stark",
            bio: "ironman",
            email: "ironman@gmail.com"
        ),
        .init(
            id: UUID().uuidString,
            userName: "Spider-Man",
            profileImageUrl: "spider-man-2",
            fullName: "Peter Benjamin Parker",
            bio: "spider-man",
            email: "spider-man@gmail.com"
        ),
        .init(
            id: UUID().uuidString,
            userName: "Hawkeye",
            profileImageUrl: "hawkeye-2",
            fullName: "Clint Barton",
            bio: "hawkeye",
            email: "hawkeye@gmail.com"
        ),
        .init(
            id: UUID().uuidString,
            userName: "Doctor-Stranger",
            profileImageUrl: "doctor-stranger-2",
            fullName: "Stephen Vincent Strange",
            bio: "doctor-stranger",
            email: "doctor-stranger@gmail.com"
        ),
        .init(
            id: UUID().uuidString,
            userName: "Black-Panther",
            profileImageUrl: "black-panther-2",
            fullName: "T'Challa",
            bio: "Wakanda Forever",
            email: "black-panther@gmail.com"
        ),
        .init(
            id: UUID().uuidString,
            userName: "Ant-Man",
            profileImageUrl: "ant-man-2",
            fullName: "Scott Lang",
            bio: "ant-man",
            email: "ant-man@gmail.com"
        )
    ]
}
