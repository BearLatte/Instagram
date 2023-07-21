//
//  UserService.swift
//  Instagram
//
//  Created by Tim on 2023/7/21.
//

import Foundation
import Firebase

struct UserService {
    
    static func fetchAllUsers() async throws -> [User] {
        let snapshot = try await Firestore.firestore().collection("users").getDocuments()
        return snapshot.documents.compactMap { try? $0.data(as: User.self) }.filter { !$0.isCurrentUser }
    }
}
