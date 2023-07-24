//
//  SearchView.swift
//  Instagram
//
//  Created by Tim on 2023/7/3.
//

import SwiftUI
import SwiftUIX

struct SearchView: View {
    
    @State private var searchText : String = ""
    
    @StateObject var viewModel = SearchViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                LazyVStack(spacing: 12) {
                    ForEach(viewModel.users) { user in
                        NavigationLink {
                            ProfileView(user: user)
                        } label: {
                            HStack {
                                CircularProfileImageView(user: user, size: .xSmall)

                                VStack(alignment: .leading) {
                                    Text(user.userName)
                                        .fontWeight(.semibold)

                                    if let fullname = user.fullname {
                                        Text(fullname)
                                    }
                                }
                                .font(.footnote)

                                Spacer()
                            }
                            .foregroundColor(.black)
                            .padding(.horizontal)
                        }
                    }
                }
                .navigationSearchBar {
                    SearchBar(text: $searchText)
                        .placeholder("Search ...")
                }
            }
            .navigationTitle("Explore")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
