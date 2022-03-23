//
//  UserListView.swift
//  InstagramSwiftUI
//
//  Created by jaeseung han on 2022/03/13.
//

import SwiftUI

struct UserListView: View {
    @ObservedObject var viewModel : SearchViewModel
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(viewModel.users) { user in
                    NavigationLink(destination: ProfileView()) {
                        UserCell(user: user)
                            .padding(.leading)
                    }
                        
                }
            }
        }
    }
}
