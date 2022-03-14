//
//  LoginView.swift
//  InstagramSwiftUI
//
//  Created by 김현미 on 2022/03/13.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var viewModel : AuthViewModel
    var body: some View {
        NavigationView {
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
                      
                        CustomSecureField(text: $password, placeholder: Text("Password"))
                            .padding()
                            .background(Color(.init(white: 1, alpha: 0.15)))
                            .cornerRadius(10)
                            .foregroundColor(.white)
                            .padding(.horizontal,32)
                    }
                  
                    HStack {
                        Spacer()
                        Button(action: {}) {
                            Text("Forgot Password?")
                                .font(.system(size:13,weight: .semibold))
                                .foregroundColor(.white)
                                .padding(.top)
                                .padding(.trailing,28)
                        }
                    }
                    // sign in
                    Button(action: {
                        viewModel.login(withEmail: email, password: password)
                        
                    }) {
                        Text("Sign In")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(width: 360, height: 50)
                        // 배경화면과 clip 등을 순서를 맞춰서 해야함
                            .background(Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)))
                            .clipShape(Capsule())
                            .padding()
                    }
                    Spacer()
                    NavigationLink(destination: RegistrationView().navigationBarHidden(true)) {
                        HStack {
                            Text("Don't have an account?")
                                .font(.system(size: 14))
                            
                            Text("Sign Up")
                                .font(.system(size: 14,weight: .semibold))
                        }.foregroundColor(.white)
                    }.padding(.bottom,16)
                    
                
                    
                }
                .padding(.top,-44)
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
