//
//  LoginView.swift
//  InstagramSwiftUI
//
//  Created by 김현미 on 2022/03/13.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.purple,Color.blue]), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                VStack {
                    Image("instagram")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        
                    // email field
                    
                    // password field
                    
                    // forgot password
                    // sign in
                    // go to sign up
                    Spacer()
                }
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
