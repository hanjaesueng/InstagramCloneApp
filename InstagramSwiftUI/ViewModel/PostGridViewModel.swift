//
//  PostGridViewModel.swift
//  InstagramSwiftUI
//
//  Created by jaeseung han on 2022/04/04.
//

import SwiftUI

enum PostGridConfiguration {
    case explore
    case profile(String)
    
}

class PostGridViewModel : ObservableObject {
    @Published var posts = [Post]()
    let config : PostGridConfiguration
    
    init(config : PostGridConfiguration) {
        self.config = config
        fetchPosts(forConfig: config)
    }
    
    func fetchPosts(forConfig config : PostGridConfiguration) {
        switch config {
        case .explore:
            fetchExplorePosts()
        case .profile(let uid):
            fetchUserPosts(forUid: uid)
        }
    }
    
    func fetchExplorePosts(){
        
        COLLECTION_POSTS.getDocuments { snapshot, _  in
            guard let documents = snapshot?.documents else {return}
            self.posts = documents.compactMap {try? $0.data(as: Post.self)}
        }
        
    }
    
    func fetchUserPosts(forUid uid : String){
        COLLECTION_POSTS.whereField("ownerUid", isEqualTo: uid).getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else {return}
            let posts = documents.compactMap({ try? $0.data(as: Post.self)})
            self.posts = posts.sorted(by: { $0.timestamp > $1.timestamp })
        }
    }
}
