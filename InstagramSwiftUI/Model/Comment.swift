//
//  Comment.swift
//  InstagramSwiftUI
//
//  Created by jaeseung han on 2022/04/13.
//

import FirebaseFirestoreSwift
import Firebase

struct Comment : Identifiable, Decodable {
    @DocumentID var id : String?
    let username : String
    let postOwnerUid : String
    let profileImageUrl : String
    let commnetText : String
    let timestamp : Timestamp
    let uid : String
    
    var timestampString : String? {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.second,.minute,.hour,.day,.weekOfMonth]
        formatter.maximumUnitCount = 2
        formatter.unitsStyle = .abbreviated
 
        return formatter.string(from: timestamp.dateValue(),to:Date()) ?? ""
    }
}
