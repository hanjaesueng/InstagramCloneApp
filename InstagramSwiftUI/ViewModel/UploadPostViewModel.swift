//
//  UploadPostViewModel.swift
//  InstagramSwiftUI
//
//  Created by 김현미 on 2022/03/24.
//

import SwiftUI
import Firebase

class UploadPostViewModel : ObservableObject {
    func uploadPost(caption : String, image: UIImage,completion: FirestoreCompletion) {
        guard let user = AuthViewModel.shared.currentUser else {return}
        ImageUploader.uploadImage(image: image, type: .post) { imageUrl in
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd HH:mm:ss.SSS"
            let timestamp = formatter.string(from: Date())
            let data = ["caption":caption,
                        "timestamp":timestamp,
                        "likes":0,
                        "imageUrl":imageUrl,
                        "ownerUid":user.id ?? "",
                        "ownerImageUrl":user.profileImageUrl,
                        "ownerUsername":user.username] as [String:Any]
            
            COLLECTION_POSTS.addDocument(data: data,completion: completion)
        }
    }
}
