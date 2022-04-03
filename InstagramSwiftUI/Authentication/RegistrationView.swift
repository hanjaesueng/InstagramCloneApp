//
//  RegistrationView.swift
//  InstagramSwiftUI
//
//  Created by 김현미 on 2022/03/13.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var fullname = ""
    @State private var username = ""
    @State private var selectedImage : UIImage?
    @State private var postImage : Image?
    @State private var imagePickerPresented = false
    //dismiss  used
    @Environment(\.presentationMode) var mode
    @EnvironmentObject var viewModel : AuthViewModel
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.pink,Color.blue]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack(spacing:20) {
                
                    if let image = postImage {
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 140, height: 140)
                            .clipShape(Circle())
                            .padding(.top,44)
                    } else {
                        Button(action: {imagePickerPresented.toggle()}) {
                            LoadImageIcon()
                                .frame(width: 140, height: 140)
                                .foregroundColor(.white)
                        }.sheet(isPresented: $imagePickerPresented, onDismiss: loadImage) {
                            ImagePicker(image: $selectedImage)
                        }
                        .padding()
                    }
                
                
                
                VStack(spacing:20){
                    CustomTextField(text: $email, placeholder: Text("Email"), imageName: "envelope")
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .padding(.horizontal,32)
                    CustomTextField(text: $username, placeholder: Text("Username"), imageName: "person")
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .padding(.horizontal,32)
                    CustomTextField(text: $fullname, placeholder: Text("Full name"), imageName: "person")
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
              
               
                // sign in
                Button(action: {
                    viewModel.register(withEamil: email, password: password,image: selectedImage,fullname: fullname,username: username)
                }) {
                    Text("Sign Up")
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
        }
    }
}

extension RegistrationView {
    func loadImage() {
        guard let selectedImage = selectedImage else {return}
        postImage = Image(uiImage: selectedImage)
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
