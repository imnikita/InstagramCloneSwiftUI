//
//  CommentsView.swift
//  InstagramSwiftUI
//
//  Created by Nikita Popov on 13.07.2021.
//

import SwiftUI
import Firebase
import FirebaseFirestoreSwift

struct CommentsView: View {
    // MARK: - Properties
    @State var commentText = ""
    @ObservedObject var viewModel : CommentsViewModel
    
    
    init(post: Post) {
        self.viewModel = CommentsViewModel(post: post)
    }
    
    // MARK: - Body
    var body: some View {
        VStack {
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 24) {
                    ForEach(viewModel.comments) { comment in
                        CommentCell(comment: comment)
                    }
                } // LazyVStack
            } // ScrollView
        } // VStack
        .padding(.top)
        
        CustomInputView(inputText: $commentText, action: uploadComment)
    }
    
    func uploadComment() {
        viewModel.uploadComments(commentText: commentText)
        commentText = ""
    }
}

struct CommentsView_Previews: PreviewProvider {
    static var previews: some View {
        CommentsView(post: Post(id: "", ownerUid: "", ownerUsername: "", caption: "", likes: 0, imageUrl: "", timestamp: Timestamp(date: Date()), ownerImageUrl: "", didLike: true))
    }
}
