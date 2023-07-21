//
//  LoginViewModel.swift
//  Instagram
//
//  Created by Tim on 2023/7/21.
//

import Foundation

class LoginViewModel : ObservableObject {
    @Published var email = ""
    @Published var password = ""
    
    func signin() async throws {
        try? await AuthService.shared.login(withEmail: email, password: password)
    }
}
