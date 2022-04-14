//
//  ProfileHeaderView.swift
//  InstagramSwiftUI
//
//  Created by 김현미 on 2022/03/13.
//

import SwiftUI
import Kingfisher

struct ProfileHeaderView: View {
    @ObservedObject var viewModel : ProfileViewModel
    
    
    var body: some View {
        VStack(alignment : .leading) {
            HStack {
                KFImage(URL(string:viewModel.user.profileImageUrl))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
                    .padding(.leading)
                Spacer()
                
                
                HStack(alignment:.center,spacing:16) {
              
                    UserStatView(value: viewModel.user.stats?.posts ?? 0, title: "Post")
                    UserStatView(value: viewModel.user.stats?.followers ?? 0, title: "Followers")
                    UserStatView(value: viewModel.user.stats?.following ?? 0, title: "Following")
                }.padding(.trailing,32)
                
            }
            Text(viewModel.user.fullname)
                .font(.system(size: 15,weight: .semibold))
                .padding([.leading,.top])
            Text("촉나라 전장군 || 유비 의형제")
                .font(.system(size: 15))
                .padding(.leading)
                .padding(.top,1)
            // 양쪽에 spacer를 둬서 가운데에 위치하게한다
            HStack {
                Spacer()
                
                ProfileAcionButtonView(viewModel: viewModel)
                
                Spacer()
            }.padding(.top)
        }
    }
}


