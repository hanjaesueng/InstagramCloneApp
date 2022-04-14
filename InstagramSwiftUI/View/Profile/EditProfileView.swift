//
//  EditProfileView.swift
//  InstagramSwiftUI
//
//  Created by jaeseung han on 2022/04/14.
//

import SwiftUI

struct EditProfileView: View {
    @ObservedObject private var viewModel : EditProfileViewModel
    @State private var bioText : String
    @Binding var user : User
    @Environment(\.presentationMode) var mode
    
    init(user : Binding<User>) {
        // _ underbar 는 binding의 의미
        self._user = user
        self.viewModel = EditProfileViewModel(user: self._user.wrappedValue)
        self._bioText = State(initialValue: _user.wrappedValue.bio ?? "")
    }
    
    var body: some View {
        
        VStack {
            HStack {
                Button(action: {
                    mode.wrappedValue.dismiss()
                }) {
                    Text("Cancel")
                }
                Spacer()
                Button(action: {
                    viewModel.saveUserData(bioText)
                }) {
                    Text("Done").bold()
                }
            }.padding()
            
            TextArea(text: $bioText, placeholder: "Add your bio..")
                .frame(width: 370, height: 200)
                .padding()
            Spacer()
        }
        .onReceive(viewModel.$uploadComplete) { completed in
            if completed {
                self.mode.wrappedValue.dismiss()
                self.user.bio = viewModel.user.bio
                AuthViewModel.shared.currentUser?.bio = viewModel.user.bio
            }
        }
        
        
        
    }
}

//struct EditProfileView_Previews: PreviewProvider {
//    static var previews: some View {
//        EditProfileView()
//    }
//}
