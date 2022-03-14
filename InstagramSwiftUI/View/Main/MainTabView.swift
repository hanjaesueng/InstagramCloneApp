//
//  MainTabView.swift
//  InstagramSwiftUI
//
//  Created by jaeseung han on 2022/03/13.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        NavigationView {
            TabView {
                FeedView()
                    .tabItem{
                        Image(systemName: "house")
                    }
                SearchView()
                    .tabItem{
                        Image(systemName: "magnifyingglass")
                    }
                UploadPostView()
                    .tabItem{
                        Image(systemName: "plus.square")
                    }
                NotificationView()
                    .tabItem{
                        Image(systemName: "heart")
                    }
                ProfileView()
                    .tabItem{
                        Image(systemName: "person")
                    }
            }
            .navigationTitle("Home")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading: logOutButton)
            .accentColor(.black)
        }
    }
    
    var logOutButton : some View {
        Button(action: {
            AuthViewModel.shared.signOut()
        }) {
            Text("Logout")
                .foregroundColor(.black)
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
