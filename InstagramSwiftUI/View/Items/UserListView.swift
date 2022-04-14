//
//  UserListView.swift
//  InstagramSwiftUI
//
//  Created by jaeseung han on 2022/03/13.
//

import SwiftUI

struct UserListView: View {
    @ObservedObject var viewModel : SearchViewModel
    @Binding var searchingStr : String
    
    var users : [User] {
        return searchingStr.isEmpty ? viewModel.users : viewModel.filteredUsers(searchingStr)
    }
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(users) { user in
                    NavigationLink(destination: LazyView(ProfileView(user: user))) {
                        UserCell(user: user)
                            .padding(.leading)
                    }
                        
                }
            }
        }
    }
}
