//
//  ResetPasswordView.swift
//  InstagramSwiftUI
//
//  Created by 김현미 on 2022/03/13.
//

import SwiftUI


struct ResetPasswordView: View {
    // shared 되는 single tone pattern의 객체, 처음 environmentObject 메서드로 생성해줌 View를 생성하면서
    @EnvironmentObject var viewModel : AuthViewModel
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct ResetPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ResetPasswordView()
    }
}
