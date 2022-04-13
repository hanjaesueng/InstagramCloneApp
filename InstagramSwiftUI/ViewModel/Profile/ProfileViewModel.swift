//
//  ProfileViewModel.swift
//  InstagramSwiftUI
//
//  Created by jaeseung han on 2022/03/24.
//

import SwiftUI

class ProfileViewModel : ObservableObject {
    @Published var user : User
    
    init(user : User) {
        self.user = user
        checkIfUserIsFollowed()
    }
    
    func follow(){
        guard let uid = user.id else {return}
        UserService.follow(uid: uid) { _ in
            self.user.isFollowed = true
            NotificationsViewModel.uploadNotification(toUid: uid, type: .follow)
        }
    }
    
    func unfollow(){
        guard let uid = user.id else {return}
        UserService.unfollow(uid: uid) { _ in
            self.user.isFollowed = false
        }
    }
    
    func checkIfUserIsFollowed() {
        guard !user.isCurrentUser else {return}
        guard let uid = user.id else {return}
        UserService.checkIFUserIsFollowed(uid: uid) { isFollowed in
            self.user.isFollowed = isFollowed
        }
    }
}

