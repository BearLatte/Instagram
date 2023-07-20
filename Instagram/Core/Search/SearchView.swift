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
    
    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                LazyVStack(spacing: 12) {
                    ForEach(User.MOCK_USERS) { user in
                        NavigationLink {
                            ProfileView(user: user)
                        } label: {
                            HStack {
                                Image(user.profileImageUrl ?? "")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 40, height: 40)
                                    .clipShape(Circle())

                                VStack(alignment: .leading) {
                                    Text(user.userName)
                                        .fontWeight(.semibold)

                                    if let fullname = user.fullName {
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
