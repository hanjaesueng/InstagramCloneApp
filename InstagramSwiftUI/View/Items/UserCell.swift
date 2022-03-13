//
//  UserCell.swift
//  InstagramSwiftUI
//
//  Created by jaeseung han on 2022/03/13.
//

import SwiftUI

struct UserCell: View {
    var body: some View {
        HStack{
            // image
            Image("chaochao")
                .resizable()
                .scaledToFill()
                .frame(width: 48, height: 48)
                .clipShape(Circle())
            // VStack -> Username,fullname, align은 leading, trailing, center설정 가능
            VStack(alignment:.leading){
                Text("조조")
                    .font(.system(size: 14,weight: .semibold))
                Text("조조 아만")
                    .font(.system(size: 14))
            }
            // 빈공간을 만들어줌
            Spacer()
        }
        
    }
}

struct UserCell_Previews: PreviewProvider {
    static var previews: some View {
        UserCell()
    }
}
