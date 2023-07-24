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
    @State private var imageSourceType : UIImagePickerController.SourceType = .photoLibrary
    @State private var isAllowEditImage: Bool = false
    @Binding var tabIndex : Int
    
    @StateObject var viewModel = UploadPostViewModel()
    
    var body: some View {
        VStack {
            // action tool bar
            HStack {
                Button {
                    clearPostDataAndReturnToFeed()
                } label: {
                    Text("Cancel")
                }
                
                Spacer()
                
                Text("New Post")
                    .fontWeight(.semibold)
                
                Spacer()
                
                Button {
                    Task {
                        try? await viewModel.uploadPost(caption:caption)
                        clearPostDataAndReturnToFeed()
                    }
                } label: {
                    Text("upload")
                        .fontWeight(.semibold)
                }
                
            }
            .padding(.horizontal)
            
            // post image and caption
            HStack {
                if let image = viewModel.postImage {
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 100)
                        .clipped()
                }
                
                if #available(iOS 16.0, *) {
                    TextField("Enter your post caption...", text: $caption, axis: .vertical)
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
        /* 此代码只在 iOS16 及以上系统版本可用
        .photosPicker(isPresented: $imagePickerPresented, selection: $viewModel.selectedPickerItem)
         */
        .sheet(isPresented: $imagePickerPresented) {
            ImagePickerView(isPresented: $imagePickerPresented, selectedImage: $viewModel.selectedImage, sourceType: $imageSourceType, isAllowEditing: $isAllowEditImage)
        }
    }
    
    func clearPostDataAndReturnToFeed() {
        caption = ""
        viewModel.postImage = nil
        tabIndex = 0
    }
}

struct UploadPostView_Previews: PreviewProvider {
    static var previews: some View {
        UploadPostView(tabIndex: .constant(0))
    }
}
