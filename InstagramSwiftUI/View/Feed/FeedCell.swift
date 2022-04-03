//
//  FeedCell.swift
//  InstagramSwiftUI
//
//  Created by jaeseung han on 2022/03/13.
//

import SwiftUI
import Kingfisher

struct FeedCell: View {
    let post : Post
    
    var body: some View {
        VStack(alignment: .leading){
            //user info
            HStack {
                KFImage(URL(string: post.ownerImageUrl))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 36, height: 36)
                    .clipped()
                    .cornerRadius(18)
                Text(post.ownerUsername)
                    .font(.system(size: 14,weight: .semibold))
            }
            .padding([.leading,.bottom],8)
            //post image
            KFImage(URL(string: post.imageUrl))
                .resizable()
                .scaledToFill()
                .frame(maxHeight : 440)
                .clipped()
            //action Buttons
            HStack(spacing:16) {
                Button(action: {}) {
                    Image(systemName: "heart")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 20, height: 20)
                        .font(.system(size: 20))
                        .padding(4)
                }
                Button(action: {}) {
                    Image(systemName: "bubble.right")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 20, height: 20)
                        .font(.system(size: 20))
                        .padding(4)
                }
                Button(action: {}) {
                    Image(systemName: "paperplane")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 20, height: 20)
                        .font(.system(size: 20))
                        .padding(4)
                }
            }
            .padding(.leading,4)
            .foregroundColor(.black)
                
            
            //caption
            Text("\(post.likes) likes")
                .font(.system(size: 14,weight: .semibold))
                .padding(.leading,8)
                .padding(.bottom,2)
            
            HStack {
                Text(post.ownerUsername).font(.system(size: 14,weight: .semibold)) + Text(" \(post.caption)")
                    .font(.system(size: 15))
            }.padding(.horizontal, 8)
            Text("2d")
                .font(.system(size: 14))
                .foregroundColor(.gray)
                .padding(.leading,8)
                .padding(.top,-2)
        }
    }
}
