//
//  User.swift
//  Instagram
//
//  Created by Tim on 2023/7/20.
//

import Foundation
import Firebase


struct User : Codable, Hashable, Identifiable {
    let id: String
    var userName : String
    var profileImageUrl : String?
    var fullname : String?
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
//            profileImageUrl: "batman-2",
            fullname: "Bruce Wayne",
            bio: "Gotham's dark Knight",
            email: "batman@gmail.com"
        ),
        .init(
            id: UUID().uuidString,
            userName: "Venom",
//            profileImageUrl: "venom-2",
            fullname: "Dddie Brook",
            bio: "Venom",
            email: "venom@gmail.com"
        ),
        .init(
            id: UUID().uuidString,
            userName: "Iron-Man",
//            profileImageUrl: "ironman-2",
            fullname: "Tony Stark",
            bio: "ironman",
            email: "ironman@gmail.com"
        ),
        .init(
            id: UUID().uuidString,
            userName: "Spider-Man",
//            profileImageUrl: "spider-man-2",
            fullname: "Peter Benjamin Parker",
            bio: "Your Friendly Neighborhood!",
            email: "spider-man@gmail.com"
        ),
        .init(
            id: UUID().uuidString,
            userName: "Hawkeye",
//            profileImageUrl: "hawkeye-2",
            fullname: "Clint Barton",
            bio: "hawkeye",
            email: "hawkeye@gmail.com"
        ),
        .init(
            id: UUID().uuidString,
            userName: "Doctor-Stranger",
//            profileImageUrl: "doctor-stranger-2",
            fullname: "Stephen Vincent Strange",
            bio: "doctor-stranger",
            email: "doctor-stranger@gmail.com"
        ),
        .init(
            id: UUID().uuidString,
            userName: "Black-Panther",
//            profileImageUrl: "black-panther-2",
            fullname: "T'Challa",
            bio: "Wakanda Forever",
            email: "black-panther@gmail.com"
        ),
        .init(
            id: UUID().uuidString,
            userName: "Ant-Man",
//            profileImageUrl: "ant-man-2",
            fullname: "Scott Lang",
            bio: "ant-man",
            email: "ant-man@gmail.com"
        )
    ]
}
