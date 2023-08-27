//
//  UploadPostViewModel.swift
//  InstagramSwiftUI
//
//  Created by Nikita Popov on 13.07.2021.
//

import SwiftUI
import Firebase


class UploadPostViewModel: ObservableObject {
    
    func uploadPosts(caption: String, image: UIImage, completion: FirestoreCompletion) {
        guard let user = AuthViewModel.shared.currentUser else { return }
        
        ImageUploader.uploadImage(image: image, type: .post) { imageUrl in
            let data = ["caption" : caption,
                        "timestamp" : Timestamp(date: Date()),
                        "likes" : 0,
                        "imageUrl" : imageUrl,
                        "ownerUid" : user.id ?? "",
                        "ownerImageUrl" : user.profileImageURL,
                        "ownerUsername" : user.username] as [String : Any]
            
            COLLECTIONS_POSTS.addDocument(data: data, completion: completion)
        }
        
    }
}
