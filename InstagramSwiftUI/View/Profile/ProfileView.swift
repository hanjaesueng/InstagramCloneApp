//
//  ProfileView.swift
//  InstagramSwiftUI
//
//  Created by jaeseung han on 2022/03/13.
//

import SwiftUI

struct ProfileView: View {
    let user : User
    
    var body: some View {
        ScrollView{
            VStack(spacing : 32){
                ProfileHeaderView(user: user)
                PostGridView()
            }
            .padding(.top)
        }
    }
}

