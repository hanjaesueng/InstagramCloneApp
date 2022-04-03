//
//  Post.swift
//  InstagramSwiftUI
//
//  Created by jaeseung han on 2022/04/03.
//

import FirebaseFirestoreSwift
import Firebase

struct Post : Identifiable,Decodable {
    @DocumentID var id : String?
    let ownerUid : String
    let caption : String
    let likes : Int
    let imageUrl : String
    let timestamp : String
    let ownerImageUrl : String
    let ownerUsername : String
}
