//
//  ProfileView.swift
//  Instagram
//
//  Created by Tim on 2023/7/3.
//

import SwiftUI

struct ProfileView: View {
    var user : User
    
    var posts : [Post] {
        return Post.MOCK_POSTS.filter { $0.user?.userName == user.userName }
    }
    
    var body: some View {
        ScrollView {
            // header
            ProfileHeaderView(user: user)
            
            // post grid view
            PostGridView(posts: posts)
        }
        .navigationTitle("Profile")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(user: User.MOCK_USERS[3])
    }
}
