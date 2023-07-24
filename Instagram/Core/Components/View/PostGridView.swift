//
//  PostGridView.swift
//  Instagram
//
//  Created by Tim on 2023/7/20.
//

import SwiftUI
import Kingfisher

struct PostGridView: View {
    
    let user  : User
    
    @StateObject var viewModel : PostGridViewModel
    
    init(user: User) {
        self.user = user
        self._viewModel = StateObject(wrappedValue: PostGridViewModel(user: user))
    }
    
    
    private let gridItems : [GridItem] = [
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1)
    ]
    private let imageDimension = UIScreen.main.bounds.width / 3 - 1
    var body: some View {
        LazyVGrid(columns: gridItems, spacing: 1) {
            ForEach(viewModel.posts) { post in
                KFImage(URL(string: post.imageUrl))
                    .resizable()
                    .scaledToFill()
                    .frame(width: imageDimension, height: imageDimension)
                    .clipped()
            }
        }
    }
}

struct PostGridView_Previews: PreviewProvider {
    static var previews: some View {
        PostGridView(user: User.MOCK_USERS[0])
    }
}
