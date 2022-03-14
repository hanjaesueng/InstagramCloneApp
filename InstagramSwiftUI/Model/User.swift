//
//  User.swift
//  InstagramSwiftUI
//
//  Created by 김현미 on 2022/03/15.
//

import FirebaseFirestoreSwift

struct User : Decodable {
    let username : String
    let email : String
    let profileImageUrl : String
    let fullname : String
    @DocumentID var id : String?
}