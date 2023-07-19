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
                    ForEach(0 ... 15, id: \.self) { _ in
                        HStack {
                            Image("batman")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 40, height: 40)
                                .clipShape(Circle())
                            
                            VStack(alignment: .leading) {
                                Text("Batman").fontWeight(.semibold)
                                Text("Bruce Wayne")
                            }
                            .font(.footnote)
                            
                            Spacer()
                        }
                        .padding(.horizontal)
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
