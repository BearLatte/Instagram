//
//  ProfileViewModel.swift
//  Instagram
//
//  Created by Tim on 2023/7/21.
//

import SwiftUI


class ProfileViewModel : ObservableObject {
    
    @Published var selectedImage : UIImage? {
        didSet {
            if let uiImage = selectedImage {
                profileImage = Image(uiImage: uiImage)
            }
        }
    }
    
    @Published var profileImage : Image?
    
}
