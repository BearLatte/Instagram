//
//  EditProfileView.swift
//  Instagram
//
//  Created by Tim on 2023/7/21.
//

import SwiftUI
import PhotosUI

struct EditProfileView: View {
//    iOS 15 以上用这个参数
//    @Environment (\.dismiss) var dismiss
    
    // 适配 iOS 14 用这个
    @Environment(\.presentationMode) var presentationMode : Binding<PresentationMode>
    
    // 适配 iOS 14 用这个
    @State var imagePickerPresented = false
    
    @StateObject var viewModel : EditProfileViewModel
    
    @State private var pickerImageSourceType = UIImagePickerController.SourceType.photoLibrary
    
    @State private var pickerImageAllowEditing = false
    
    /// iOS 16 以后用这个属性
//    @State private var selectedImage : PhotosPickerItem?
    
    init(user: User) {
        self._viewModel = StateObject(wrappedValue: EditProfileViewModel(user: user))
    }
    
    var body: some View {
        VStack {
            
            // tool bar
            HStack {
                Button("Cancel") {
                    presentationMode.wrappedValue.dismiss()
                }
                
                Spacer()
                
                Text("Edit Profile")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                
                Spacer()
                
                Button {
                    Task {
                        try await viewModel.updateUserData()
                        presentationMode.wrappedValue.dismiss()
                    }
                } label: {
                    Text("Done")
                        .fontWeight(.bold)
                }
            }
            .padding(.horizontal)
            
            Divider()
            
            // edit profile pic
            Button {
                imagePickerPresented.toggle()
            } label: {
                VStack {
                    if let image = viewModel.profileImage {
                        image
                            .resizable()
                            .frame(width: 80, height: 80)
                            .foregroundColor(.white)
                            .background(Color.gray)
                            .clipShape(Circle())
                    } else {
                        CircularProfileImageView(user: viewModel.user, size: .large)
                    }
                    
                    
                    Text("Edit profile picture")
                        .font(.footnote)
                        .fontWeight(.semibold)
                    
                    Divider()
                }
            }
            .padding(.vertical, 8)

            //            if #available(iOS 16.0, *) {
//                PhotosPicker(selection: $selectedImage) {
//                    Image(systemName: "person.circle")
//                        .resizable()
//                        .frame(width: 80, height: 80)
//                }
//            }
            
            // edit info
            EditProfileRowView(title: "Name", placeholder: "Enter your name...", text: $viewModel.fullname)
            EditProfileRowView(title: "Bio", placeholder: "Enter your bio...",  text: $viewModel.bio)
                        
            Spacer()
            
        }
        .sheet(isPresented: $imagePickerPresented) {
            ImagePickerView(isPresented: $imagePickerPresented, selectedImage: $viewModel.selectedImage, sourceType: $pickerImageSourceType, isAllowEditing: $pickerImageAllowEditing)
        }
    }
}

struct EditProfileRowView : View {
    let title : String
    let placeholder : String
    
    @Binding var text : String
    
    var body: some View {
        HStack {
            Text(title)
                .padding(.leading, 8)
                .frame(width: 100, alignment: .leading)
            
            VStack {
                TextField(placeholder, text: $text)
                Divider()
            }
        }
        .font(.subheadline)
        .frame(height: 36)
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView(user: User.MOCK_USERS[0])
    }
}
