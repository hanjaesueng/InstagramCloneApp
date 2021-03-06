//
//  AuthViewModel.swift
//  InstagramSwiftUI
//
//  Created by 김현미 on 2022/03/14.
//

import SwiftUI
import Firebase

// 앱에서 observe할수 있는 객체
class AuthViewModel : ObservableObject {
    @Published var userSession : FirebaseAuth.User?
    @Published var currentUser : User?
    @Published var didSendResetPasswordLink = false
    
    static let shared = AuthViewModel()
    
    init() {
        
        userSession = Auth.auth().currentUser
        fetchUser()
    }
    func login(withEmail email : String,password : String){
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            
            if let error = error {
                print("DEBUG: Login failed",error.localizedDescription)
                return
            }
            guard let user = result?.user else {return}
            
            self.userSession = user
            self.fetchUser()
        }
    }
    
    func register(withEamil email : String,password : String,
                  image : UIImage?, fullname : String, username : String){
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            guard let image = image else {return}

            ImageUploader.uploadImage(image: image, type: .profile) { imageUrl in
                if let error = error {
                    print(error.localizedDescription)
                    return
                }
                guard let user = result?.user else {return}
                
                print("successfully registerd in...")
                
                let data = ["email":email,
                            "username" : username,
                            "fullname":fullname,
                            "profileImageUrl":imageUrl,
                            "uid":user.uid]
                COLLECTION_USERS.document(user.uid).setData(data) { _ in
                    print("successfully uploaded user data...")
                    // @Published 인 userSession이 변경되면 얘를 참조하는 ContentView에서 body를 다시 불러온다
                    self.userSession = user
                }
            }
        }
    }
    
    func signOut(){
        self.userSession = nil
        try? Auth.auth().signOut()
    }
    
    
    
    func resetPassword(withEmail email : String) {
        Auth.auth().sendPasswordReset(withEmail: email) { error in
            if let error = error {
                print("Failed to send link with error \(error.localizedDescription)")
                self.didSendResetPasswordLink = false
                return
            }
            self.didSendResetPasswordLink = true
            print("Succefully sent link...")
        }
    }
    
    func fetchUser(){
        guard let uid = userSession?.uid else {return}
        COLLECTION_USERS.document(uid).getDocument { snapshot,_ in
            guard let user = try? snapshot?.data(as: User.self) else {return}
            self.currentUser = user
           
        }
    }
}
