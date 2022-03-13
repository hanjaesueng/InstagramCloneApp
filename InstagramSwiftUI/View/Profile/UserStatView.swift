//
//  UserStatView.swift
//  InstagramSwiftUI
//
//  Created by 김현미 on 2022/03/13.
//

import SwiftUI

struct UserStatView : View{
    let value : Int
    let title : String
    
    var body : some View {
        VStack {
            Text("\(value)")
                .font(.system(size: 15,weight: .semibold))
            Text(title)
                .font(.system(size: 15))
        }
        // frame 크기를 정해줌으로써 ui 가 망가지지 않게 함
        .frame(width: 80, alignment: .center)
    }
}


struct UserStatView_Previews: PreviewProvider {
    static var previews: some View {
        UserStatView(value: 1, title: "Post")
    }
}
