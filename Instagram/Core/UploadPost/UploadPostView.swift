//
//  UploadPostView.swift
//  Instagram
//
//  Created by Tim on 2023/7/20.
//

import SwiftUI
import PhotosUI

struct UploadPostView: View {
    
    @State var caption = ""
    @State private var imagePickerPresented = false
    @State private var selectedImage : UIImage = UIImage() {
        didSet {
            viewModel.selectedImage = selectedImage
        }
    }
    @State private var imageSourceType : UIImagePickerController.SourceType = .photoLibrary
    @State private var isAllowEditImage: Bool = false
    
    @StateObject var viewModel = UploadPostViewModel()
    
    var body: some View {
        VStack {
            // action tool bar
            HStack {
                Button {
                    print("cancel upload")
                } label: {
                    Text("Cancel")
                }
                
                Spacer()
                
                Text("New Post")
                    .fontWeight(.semibold)
                
                Spacer()
                
                Button {
                    print("upload post")
                } label: {
                    Text("upload")
                        .fontWeight(.semibold)
                }
                
            }
            .padding(.horizontal)
            
            // post image and caption
            HStack {
                Image(uiImage: viewModel.selectedImage ?? UIImage())
                    .resizable()
                    .frame(width: 100, height: 100)
                if #available(iOS 16.0, *) {
                    TextField("Enter your post caption", text: $caption, axis: .vertical)
                        .multilineTextAlignment(.leading)
                } else {
                    ZStack(alignment: .topLeading) {
                        TextEditor(text: $caption)
                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 100)
                            .background(Color.orange)
                        
                        if caption.isEmpty {
                            Text("Enter your post caption...")
                                .foregroundColor(.gray)
                                .padding(.top, 8)
                                .padding(.leading, 5)
                        }
                    }
                }
                
            }
            .padding(.horizontal)
            
            Spacer()
        }
        .onAppear{
            imagePickerPresented.toggle()
        }
        .sheet(isPresented: $imagePickerPresented) {
            ImagePickerView(isPresented: $imagePickerPresented, selectedImage: $selectedImage, sourceType: $imageSourceType, isAllowEditing: $isAllowEditImage)
        }
    }
}

struct UploadPostView_Previews: PreviewProvider {
    static var previews: some View {
        UploadPostView()
    }
}
