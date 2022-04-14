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
    @Binding var email : String
    @Environment(\.presentationMode) var mode
    
    init(email : Binding<String>) {
        self._email = email
    }
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.pink,Color.blue]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack(spacing:20) {
                Image("instagram")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    
                
                
                VStack(spacing:20){
                    CustomTextField(text: $email, placeholder: Text("Email"), imageName: "envelope")
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .padding(.horizontal,32)
                  

                }
              
                
                // sign in
                Button(action: {
                    viewModel.resetPassword(withEmail: email)
                    
                }) {
                    Text("Send Reset Password Link")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 360, height: 50)
                    // 배경화면과 clip 등을 순서를 맞춰서 해야함
                        .background(Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)))
                        .clipShape(Capsule())
                        .padding()
                }
                Spacer()
                Button(action: {
                    mode.wrappedValue.dismiss()
                }) {
                    HStack {
                        Text("Already have an account?")
                            .font(.system(size: 14))
                        
                        Text("Sign In")
                            .font(.system(size: 14,weight: .semibold))
                    }.foregroundColor(.white)
                }.padding(.bottom,16)
                
            
                
            }
            .padding(.top,-44)
        }
        .onReceive(viewModel.$didSendResetPasswordLink) { _ in
            self.mode.wrappedValue.dismiss()
        }
    }
}

