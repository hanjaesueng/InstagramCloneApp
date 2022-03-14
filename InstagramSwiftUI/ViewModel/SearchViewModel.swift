//
//  SearchViewModel.swift
//  InstagramSwiftUI
//
//  Created by 김현미 on 2022/03/15.
//

import SwiftUI

class SearchViewModel : ObservableObject {
    @Published var users = [User]()
    
    init() {
        fetchUsers()
    }
    
    func fetchUsers() {
        COLLECTION_USERS.getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else {return}
            self.users = documents.compactMap {
                try? $0.data(as: User.self)
            }
        }
    }
}
