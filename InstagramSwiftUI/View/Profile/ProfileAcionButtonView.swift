//
//  ProfileAcionButtonView.swift
//  InstagramSwiftUI
//
//  Created by 김현미 on 2022/03/13.
//

import SwiftUI

struct ProfileAcionButtonView: View {
    @ObservedObject var viewModel : ProfileViewModel
    var isFollowed : Bool {
        viewModel.user.isFollowed ?? false
    }
    
    var body: some View {
        if viewModel.user.isCurrentUser {
            // edit profile button
            Button(action: {}) {
                Text("Edit Profile")
                    .font(.system(size: 14,weight: .semibold))
                    .frame(width: 360, height: 32)
                    .foregroundColor(.black)
                    .overlay(
                        RoundedRectangle(cornerRadius: 3)
                            .stroke(Color.gray,lineWidth: 1)
                    )
            }
        } else {
            HStack {
                
                Button(action: { isFollowed ? viewModel.unfollow() : viewModel.follow()}) {
                    Text(isFollowed ? "Following" : "Follow")
                        .font(.system(size: 14,weight: .semibold))
                        .frame(width: 172, height: 32)
                        .foregroundColor(isFollowed ? .black : .white )
                        .background(isFollowed ? .white : .blue)
                        .overlay(
                            RoundedRectangle(cornerRadius: 3)
                                .stroke(Color.gray,lineWidth: isFollowed ? 1 : 0)
                        )
                }.cornerRadius(3)
                Button(action: {}) {
                    Text("Message")
                        .font(.system(size: 14,weight: .semibold))
                        .frame(width: 172, height: 32)
                        .foregroundColor(.black)
                        .overlay(
                            RoundedRectangle(cornerRadius: 3)
                                .stroke(Color.gray,lineWidth: 1)
                        )
                }
            }
        }
    }
}

