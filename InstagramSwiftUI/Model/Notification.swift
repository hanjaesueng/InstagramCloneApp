//
//  Notification.swift
//  InstagramSwiftUI
//
//  Created by jaeseung han on 2022/04/13.
//

import FirebaseFirestoreSwift
import Firebase

struct Notification : Identifiable, Decodable {
    @DocumentID var id : String?
    var postId : String?
    let username : String
    let profileImageUrl : String
    let timestamp : Timestamp
    let type : NotificationType
    let uid : String
    
    var isFollowed : Bool? = false
    var post : Post?
    var user : User?
}

enum NotificationType : Int,Decodable {
    case like
    case comment
    case follow
    
    var notificationMessage : String {
        switch self {
        case .like:return " 포스트를 좋아합니다."
        case .comment:return " 포스트에 댓글을 달았습니다."
        case .follow:return " 당신을 팔로우합니다."
        }
    }
}
