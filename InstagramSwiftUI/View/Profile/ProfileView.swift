//
//  ProfileView.swift
//  InstagramSwiftUI
//
//  Created by jaeseung han on 2022/03/13.
//

import SwiftUI

struct ProfileView: View {
    let user : User
    @ObservedObject var viewModel : ProfileViewModel
    
    // 바로 viewModel을 ProfileViewModel(user : user) 이런식으로 바로 초기화할수없어서 init 생성자를 이용하여 초기화
    init(user : User) {
        self.user = user
        self.viewModel = ProfileViewModel(user: user)
    }
    
    var body: some View {
        ScrollView{
            VStack(spacing : 32){
                ProfileHeaderView(viewModel: viewModel)
                PostGridView(config: .profile(user.id ?? ""))
            }
            .padding(.top)
        }
    }
}

