//
//  UploadPostViewModel.swift
//  Instagram
//
//  Created by Tim on 2023/7/20.
//

import Foundation
import SwiftUI
import PhotosUI

//@MainActor
class UploadPostViewModel : ObservableObject {
    
    @Published var selectedImage : UIImage? {
        didSet {
            if let uiImage = selectedImage {
                postImage = Image(uiImage: uiImage)
            }
        }
    }
    
    @Published var postImage : Image?
    
    /*  以下为 iOS 16.0 及以上系统获取相册图片逻辑
         @Published var selectedPickerItem : PhotosPickerItem? {
             didSet { Task { await loadImage(fromItem: selectedPickerItem) } }
         }

         @Published var postImage : Image?
         
         @available(iOS 16.0, *)
         func loadImage(fromItem item: PhotosPickerItem?) async {
             guard let item = item else { return }
             guard let data = try? await item.loadTransferable(type: Data.self) else { return }
             guard let uiImage = UIImage(data: data) else { return }
             self.postImage = Image(uiImage: uiImage)
         }
     */
    
}


