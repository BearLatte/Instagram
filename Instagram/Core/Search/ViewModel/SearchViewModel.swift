//
//  SearchViewModel.swift
//  Instagram
//
//  Created by Tim on 2023/7/21.
//

import Foundation


class SearchViewModel : ObservableObject {
    @Published var users = [User]()
    
    init() {
        Task { try await fetchAllUsers() }
    }
    
    @MainActor
    func fetchAllUsers() async throws {
        users = try await UserService.fetchAllUsers()
    }
}
