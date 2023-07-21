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
    
    @StateObject var viewModel = ProfileViewModel()
    
    @State private var pickerImageSourceType = UIImagePickerController.SourceType.photoLibrary
    
    @State private var pickerImageAllowEditing = false
    
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
                    
                } label: {
                    Text("Done")
                        .fontWeight(.bold)
                }
            }
            .padding()
            
            Divider()
            
            // edit profile pic
            
            // edit info
                        
            Spacer()
            
        }
        .sheet(isPresented: $imagePickerPresented) {
            ImagePickerView(isPresented: $imagePickerPresented, selectedImage: $viewModel.selectedImage, sourceType: $pickerImageSourceType, isAllowEditing: $pickerImageAllowEditing)
        }
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView()
    }
}
