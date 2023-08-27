//
//  NotificationCell.swift
//  InstagramSwiftUI
//
//  Created by Nikita Popov on 10.07.2021.
//

import SwiftUI
import Kingfisher

struct NotificationCell: View {
    // MARK: - Properties
    @ObservedObject var viewModel: NotificationCellViewModel
    @State private var showPostImage = true
    var isFollowed: Bool { viewModel.notification.isFollowed ?? false }
    
    init(viewModel: NotificationCellViewModel) {
        self.viewModel = viewModel
    }
    
    
    // MARK: - Body
    var body: some View {
        
        HStack {
            if let user = viewModel.notification.user {
                NavigationLink(
                    destination: ProfileView(user: user),
                    label: {
                        KFImage(URL(string: viewModel.notification.profileImageUrl))
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40, height: 40)
                            .clipShape(Circle())
                        
                        Text(viewModel.notification.userName).font(.system(size: 14, weight: .semibold)) +
                            Text(viewModel.notification.type.notificationMessage).font(.system(size: 15)) +
                            Text(" \(viewModel.timestamp)").font(.system(size: 12)).foregroundColor(.gray)
                        
                    })
            }
            
            Spacer()
            
            if viewModel.notification.type != .follow {
                if let post = viewModel.notification.post {
                    NavigationLink(
                        destination: FeedCell(viewModel: FeedCellViewModel(post: post)),
                        label: {
                            KFImage(URL(string: post.imageUrl))
                                .resizable()
                                .scaledToFit()
                                .frame(width: 40, height: 40)
                                .clipped()
                        })
                }
            } else {
                Button(action: {
                    isFollowed ? viewModel.unfollow() : viewModel.follow()
                }, label: {
                    Text(isFollowed ? "Following" : "Follow")
                        .font(.system(size: 14, weight: .semibold))
                        .frame(width: 100, height: 32, alignment: .center)
                        .foregroundColor(isFollowed ? .black : .white)
                        .background(isFollowed ? Color.white : Color.blue)
                        .cornerRadius(3)
                        .overlay(
                            RoundedRectangle(cornerRadius: 3)
                                .stroke(Color.gray,lineWidth: isFollowed ? 1 : 0)
                        )
                })
            }
            
            
        }
        .padding(.horizontal)
        
    }
}

//struct NotificationCell_Previews: PreviewProvider {
//    static var previews: some View {
//        NotificationCell()
//        //            .previewLayout(.sizeThatFits)
//    }
//}
