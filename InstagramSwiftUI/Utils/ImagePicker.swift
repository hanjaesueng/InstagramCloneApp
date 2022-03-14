//
//  ImagePicker.swift
//  InstagramSwiftUI
//
//  Created by 김현미 on 2022/03/13.
//

import SwiftUI

struct ImagePicker : UIViewControllerRepresentable {
    @Binding var image : UIImage?
    @Environment(\.presentationMode) var mode
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
    class Coordinator : NSObject, UINavigationControllerDelegate , UIImagePickerControllerDelegate {
        let parent : ImagePicker
        
        init(_ parent : ImagePicker){
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            guard let image = info[.originalImage] as? UIImage else {return}
            print("select image")
            self.parent.image = image
            self.parent.mode.wrappedValue.dismiss()
            
        }
    }
}
