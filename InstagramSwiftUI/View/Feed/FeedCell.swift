//
//  FeedCell.swift
//  InstagramSwiftUI
//
//  Created by Nikita Popov on 10.07.2021.
//

import SwiftUI
import Kingfisher

struct FeedCell: View {
    // MARK: - Properties
    @ObservedObject var viewModel: FeedCellViewModel
    
    var didLike: Bool { viewModel.post.didLike ?? false }
    
    init(viewModel: FeedCellViewModel) {
        self.viewModel = viewModel
        viewModel.checkIfUserLikedPost()
    }
    
    // MARK: - Body
    var body: some View {
        VStack(alignment: .leading) {
            
            // MARK: - UserInfo
            HStack {
                KFImage(URL(string: viewModel.post.ownerImageUrl))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 36, height: 36)
                    .clipped()
                    .cornerRadius(18)
                
                Text(viewModel.post.ownerUsername)
                    .font(.system(size: 14))
                    .fontWeight(.semibold)
                
            }
            .padding(.leading, 8)
            
            // MARK: - PostImage
            KFImage(URL(string: viewModel.post.imageUrl))
                .resizable()
                .scaledToFill()
                .frame(maxHeight: 440)
                .clipped()
                
            // MARK: - ActionButtons
            HStack(spacing: 8){
                Button(action: {
                    didLike ? viewModel.unlike() : viewModel.like()
                }, label: {
                    Image(systemName: didLike ? "heart.fill" : "heart")
                        .resizable()
                        .scaledToFill()
                        .foregroundColor(didLike ? .red : .black)
                        .frame(width: 20, height: 20)
                        .font(.system(size: 20))
                        .padding(4)
                })
                
                NavigationLink(
                    destination: CommentsView(post: viewModel.post),
                    label: {
                        Image(systemName: "bubble.right")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 20, height: 20)
                            .font(.system(size: 20))
                            .padding(4)
                    })
                
                Button(action: { }, label: {
                    Image(systemName: "paperplane")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 20, height: 20)
                        .font(.system(size: 20))
                        .padding(4)
                })
            } // Button's HStack
            .padding(.leading, 4)
            .foregroundColor(.black)
            
            // MARK: - Caption
            Text(viewModel.likeString)
                .font(.system(size: 14, weight: .semibold))
                .padding(.leading, 8)
                .padding(.bottom, 2)
            
            HStack {
                Text("\(viewModel.post.ownerUsername) ").font(.system(size: 14, weight: .semibold)) +
                    Text(viewModel.post.caption).font(.system(size: 15))
            }
            .padding(.horizontal, 8)
            
            Text(" \(viewModel.timestamp)").font(.system(size: 14))
                .foregroundColor(.gray)
                .padding(.leading, 4)
                .padding(.top, -2)
            
        } //MainVStack
        .frame(
          minWidth: 0,
          maxWidth: .infinity,
          minHeight: 0,
          maxHeight: .infinity,
          alignment: .leading
        )
    }
}

//struct FeedCell_Previews: PreviewProvider {
//    static var previews: some View {
//        FeedCell()
//    }
//}
