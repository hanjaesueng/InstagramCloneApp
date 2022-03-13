//
//  NotificationCell.swift
//  InstagramSwiftUI
//
//  Created by 김현미 on 2022/03/13.
//

import SwiftUI

struct NotificationCell: View {
    @State private var showPostImage = true
    
    var body: some View {
        HStack{
            Image("chaochao")
                .resizable()
                .scaledToFill()
                .frame(width: 40, height: 40)
                .clipShape(Circle())
            Text("조조").font(.system(size: 14,weight: .semibold)) + Text(" 좋아요를 눌렀습니다.")
                .font(.system(size: 15))
            Spacer()
            
            if showPostImage {
                Image("chaochao")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
            } else {
                Button(action: {}) {
                    Text("Follow")
                        .padding(.horizontal,20)
                        .padding(.vertical,8)
                        .background(Color(.systemBlue))
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                        .font(.system(size: 14,weight: .semibold))
                }
            }
        }.padding(.horizontal)
    }
}

struct NotificationCell_Previews: PreviewProvider {
    static var previews: some View {
        NotificationCell()
    }
}
