//
//  ImagePickerView.swift
//  Instagram
//
//  Created by Tim on 2023/7/20.
//

import SwiftUI

struct ImagePickerView:UIViewControllerRepresentable{
    @Binding var isPresented:Bool
    @Binding var selectedImage:UIImage
    @Binding var sourceType: UIImagePickerController.SourceType
    @Binding var isAllowEditing : Bool
    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }
    
    class Coordinator:NSObject,UINavigationControllerDelegate,UIImagePickerControllerDelegate{
        var parent:ImagePickerView
        init(parent:ImagePickerView) {
            self.parent = parent
        }
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let selectedImage = info[.originalImage] as? UIImage{
                self.parent.selectedImage = selectedImage
                
                self.parent.isPresented = false
            }
        }
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let controller = UIImagePickerController()
        controller.allowsEditing = isAllowEditing
        controller.sourceType = sourceType
        controller.delegate = context.coordinator
        return controller
    }
}
