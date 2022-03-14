//
//  ImageUploader.swift
//  InstagramSwiftUI
//
//  Created by 김현미 on 2022/03/15.
//

import UIKit
import Firebase

struct ImageUploader {
    static func uploadImage(image : UIImage,completion : @escaping (String)->Void) {
        guard let imageData = image.jpegData(compressionQuality: 0.5) else {return}
        let filename = NSUUID().uuidString
        let ref = Storage.storage().reference(withPath: "/profile_images/\(filename)")
        
        ref.putData(imageData, metadata: nil) { _, error in
            if let error = error {
                print("DEBUG : Failed to upload image \(error.localizedDescription)")
                return
            }
            
            print("successfully uploaded image...")
            
            ref.downloadURL { url, _ in
                guard let imageUrl = url?.absoluteString else {return}
                completion(imageUrl)
            }
        }
    }
}
