//
//  User.swift
//  InstagramSwiftUI
//
//  Created by Nikita Popov on 12.07.2021.
//

import SwiftUI
import FirebaseFirestoreSwift

struct User: Identifiable, Decodable {
    let username: String
    let email: String
    let fullname: String
    let profileImageURL: String
    @DocumentID var id: String?
    var isFollowed: Bool? = false
    var stats: UserStats?
    
    var isCurrentUser: Bool { AuthViewModel.shared.userSession?.uid == id }
}

struct UserStats: Decodable {
    var following: Int
    var posts: Int
    var followers: Int
}

