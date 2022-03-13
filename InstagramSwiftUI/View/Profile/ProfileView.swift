//
//  ProfileView.swift
//  InstagramSwiftUI
//
//  Created by jaeseung han on 2022/03/13.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        ScrollView{
            VStack(spacing : 32){
                ProfileHeaderView()
                PostGridView()
            }
            .padding(.top)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
