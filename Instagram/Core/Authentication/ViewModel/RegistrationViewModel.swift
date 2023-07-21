//
//  RegistrationViewModel.swift
//  Instagram
//
//  Created by Tim on 2023/7/21.
//

import Foundation

class RegistrationViewModel : ObservableObject {
    @Published var email : String = ""
    @Published var username : String = ""
    @Published var password : String = ""
    
    
    func createUser() async throws {
        try await AuthService.shared.createUser(email: email, password: password, userName: username)
        
        email = ""
        username = ""
        password = ""
    }
}
