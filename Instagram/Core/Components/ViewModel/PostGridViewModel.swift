//
//  PostGridViewModel.swift
//  Instagram
//
//  Created by Tim on 2023/7/24.
//

import Foundation

class PostGridViewModel : ObservableObject {
    @Published var posts = [Post]()
    
    private let user : User
    
    init(user: User) {
        self.user = user
        Task { try await fetchUserPosts() }
    }
    
    @MainActor
    func fetchUserPosts() async throws {
        self.posts = try await PostService.fetchUserPosts(uid: user.id)
        
        for i in 0 ..< self.posts.count {
            posts[i].user = self.user
        }
    }
}
