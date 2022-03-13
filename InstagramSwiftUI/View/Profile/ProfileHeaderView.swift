//
//  ProfileHeaderView.swift
//  InstagramSwiftUI
//
//  Created by 김현미 on 2022/03/13.
//

import SwiftUI

struct ProfileHeaderView: View {
    var body: some View {
        VStack(alignment : .leading) {
            HStack {
                Image("gwanuo")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
                    .padding(.leading)
                Spacer()
                
                
                HStack(alignment:.center,spacing:16) {
                    UserStatView(value: 1, title: "Post")
                    UserStatView(value: 2, title: "Followers")
                    UserStatView(value: 4, title: "Following")
                }.padding(.trailing,32)
                
            }
            Text("관우")
                .font(.system(size: 15,weight: .semibold))
                .padding([.leading,.top])
            Text("촉나라 전장군 || 유비 의형제")
                .font(.system(size: 15))
                .padding(.leading)
                .padding(.top,1)
            // 양쪽에 spacer를 둬서 가운데에 위치하게한다
            HStack {
                Spacer()
                
                ProfileAcionButtonView()
                
                Spacer()
            }.padding(.top)
        }
    }
}



struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView()
    }
}
