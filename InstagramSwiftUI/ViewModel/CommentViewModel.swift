//
//  CommentViewModel.swift
//  InstagramSwiftUI
//
//  Created by Nikita Popov on 13.07.2021.
//

import SwiftUI
import Firebase


class CommentsViewModel: ObservableObject {
    
    private let post: Post
    @Published var comments = [Comment]()
    
    init(post: Post) {
        self.post = post
        fetchComments()
    }
    
    func uploadComments(commentText: String) {
        guard let user = AuthViewModel.shared.currentUser else { return }
        guard let postId = post.id else { return }
        let data = ["userName" : user.username,
                    "profileImageUrl" : user.profileImageURL,
                    "uid" : user.id ?? "",
                    "timestamp" : Timestamp(date: Date()),
                    "postOwnerUid" : post.ownerUid,
                    "commentText" : commentText] as [String : Any]
        
        COLLECTIONS_POSTS.document(postId).collection("post-comments").addDocument(data: data) {
            error in
            if let error = error {
                print("ERROR: \(error.localizedDescription)")
                return
            }
            NotificationsViewModel.uploadNotification(toUid: self.post.ownerUid, type: .comment, post: self.post)
        }
    }
    
    func fetchComments() {
        guard let postId = post.id else { return }
        let query = COLLECTIONS_POSTS.document(postId).collection("post-comments")
            .order(by: "timestamp", descending: true)
        
        query.addSnapshotListener { snapshot, _ in
            guard let addedDocs = snapshot?.documentChanges.filter({ $0.type == .added }) else { return }
            self.comments.append(contentsOf: addedDocs.compactMap({ try? $0.document.data(as: Comment.self) }))
        }
    }
    
}
