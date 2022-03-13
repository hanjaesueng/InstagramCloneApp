//
//  FeedCell.swift
//  InstagramSwiftUI
//
//  Created by jaeseung han on 2022/03/13.
//

import SwiftUI

struct FeedCell: View {
    var body: some View {
        VStack(alignment: .leading){
            //user info
            HStack {
                Image("chaochao")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 36, height: 36)
                    .clipped()
                    .cornerRadius(18)
                Text("joker")
                    .font(.system(size: 14,weight: .semibold))
            }
            .padding([.leading,.bottom],8)
            //post image
            Image("chaochao")
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
            Text("3 likes")
                .font(.system(size: 14,weight: .semibold))
                .padding(.leading,8)
                .padding(.bottom,2)
            
            HStack {
                Text("조조").font(.system(size: 14,weight: .semibold)) + Text(" 차라리 내가 천하를 등질지언정, 천하가 나를 등지게 하지는 않겠다.")
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

struct FeedCell_Previews: PreviewProvider {
    static var previews: some View {
        FeedCell()
    }
}
