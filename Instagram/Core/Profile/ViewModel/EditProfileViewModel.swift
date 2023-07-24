//
//  EditProfileViewModel.swift
//  Instagram
//
//  Created by Tim on 2023/7/21.
//

import SwiftUI
import Firebase


@MainActor
class EditProfileViewModel : ObservableObject {
    @Published var user : User
    
    @Published var fullname : String = ""
    
    @Published var bio : String = ""
    
    @Published var selectedImage : UIImage? {
        didSet {
            if let uiImage = selectedImage {
                profileImage = Image(uiImage: uiImage)
            }
        }
    }
    
    @Published var profileImage : Image?
    
    init(user: User) {
        self.user = user
        
        if let fullname = user.fullname {
            self.fullname = fullname
        }
        
        if let bio = user.bio {
            self.bio = bio
        }
    }
    
    
    func updateUserData() async throws {
        // update profile image if changed
        
        var data = [String : Any]()
        
        if let uiImage = self.selectedImage {
            let imageUrl = try await ImageUploader.uploadImage(image: uiImage)
            data["profileImageUrl"] = imageUrl
        }
        
        // update name if changed
        if !fullname.isEmpty && user.fullname != fullname {
            data["fullname"] = fullname
        }
        
        // update bio if changed
        if !bio.isEmpty && user.bio != bio {
            data["bio"] = bio
        }
        
        if !data.isEmpty {
            try await Firestore.firestore().collection("users").document(user.id).updateData(data)
        }
    }
    
}
