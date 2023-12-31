//
//  PostDataModel.swift
//  InstagramSwiftUI
//
//  Created by Nikita Popov on 13.07.2021.
//

import FirebaseFirestoreSwift
import Firebase


struct Post: Identifiable, Decodable {
    @DocumentID var id: String?
    let ownerUid: String
    let ownerUsername: String
    let caption: String
    var likes: Int
    let imageUrl: String
    let timestamp: Timestamp
    let ownerImageUrl: String
    
    var didLike: Bool? = false
}

