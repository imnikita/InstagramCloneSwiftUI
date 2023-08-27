//
//  CommentCell.swift
//  InstagramSwiftUI
//
//  Created by Nikita Popov on 13.07.2021.
//

import SwiftUI
import Kingfisher

struct CommentCell: View {
    
    let comment: Comment
    
    var body: some View {
        HStack {
            KFImage(URL(string: comment.profileImageUrl))
                .resizable()
                .scaledToFill()
                .frame(width: 36, height: 36, alignment: .center)
                .clipShape(Circle())
            
            Text("\(comment.userName) ")
                .font(.system(size: 16, weight: .semibold)) +
            Text(comment.commentText)
                .font(.system(size: 14))
            
            Spacer()
            
            Text(" \(comment.timestampString ?? "")")
                .foregroundColor(.gray)
                .font(.system(size: 12))
//                .padding(.trailing)
        }
        .padding(.horizontal)
    }
}

//struct CommentCell_Previews: PreviewProvider {
//    static var previews: some View {
//        CommentCell()
//    }
//}
