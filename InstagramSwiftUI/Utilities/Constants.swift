//
//  Constants.swift
//  InstagramSwiftUI
//
//  Created by Nikita Popov on 12.07.2021.
//

import SwiftUI
import Firebase

let COLLECTIONS_USERS = Firestore.firestore().collection("users")
let COLLECTIONS_FOLLOWERS = Firestore.firestore().collection("followers")
let COLLECTIONS_FOLLOWING = Firestore.firestore().collection("following")
let COLLECTIONS_POSTS = Firestore.firestore().collection("posts")
let COLLECTIONS_NOTIFICATIONS = Firestore.firestore().collection("notifications")
