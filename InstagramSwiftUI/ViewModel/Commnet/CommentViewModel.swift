//
//  CommentViewModel.swift
//  InstagramSwiftUI
//
//  Created by jaeseung han on 2022/04/13.
//

import SwiftUI
import Firebase

class CommentViewModel : ObservableObject {
    private let post : Post
    @Published var commnets = [Comment]()

    init(post : Post) {
        self.post = post
        fetchComments()
    }
    func uploadCommnet(commentText : String){
        guard let user = AuthViewModel.shared.currentUser else { return }
        guard let postId = post.id else {return}
        let data : [String:Any] = ["username":user.username,
                                  "profileImageUrl":user.profileImageUrl,
                                  "uid":user.id ?? "",
                                  "timestamp":Timestamp(date:Date()),
                                  "postOwnerUid":post.ownerUid,
                                  "commnetText":commentText]
        COLLECTION_POSTS.document(postId).collection("post-comments").addDocument(data: data) { error in
            if let error = error {
                print("DEBUG : Error upload comment \(error.localizedDescription)")
                return
            }
            
            NotificationsViewModel.uploadNotification(toUid: self.post.ownerUid, type: .comment, post: self.post)
        }
    }

    func fetchComments(){
        guard let postId = post.id else {return}
        let query = COLLECTION_POSTS.document(postId).collection("post-comments").order(by: "timestamp", descending: true)
        query.addSnapshotListener { snapshot, error in
            guard let addedDocs = snapshot?.documentChanges.filter({ $0.type == .added }) else {
                return}
            self.commnets.append(contentsOf: addedDocs.compactMap({ try? $0.document.data(as: Comment.self) }))
        }
    }
}
