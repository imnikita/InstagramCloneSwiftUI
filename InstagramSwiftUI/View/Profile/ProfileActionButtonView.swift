//
//  ProfileActionButtonView.swift
//  InstagramSwiftUI
//
//  Created by Nikita Popov on 11.07.2021.
//

import SwiftUI

struct ProfileActionButtonView: View {
    // MARK: - Properties
//    let isCurrentUser: Bool
    @ObservedObject var viewModel: ProfileViewModel
    var isFollowed: Bool { viewModel.user.isFollowed ?? false }
    
    // MARK: - Body
    var body: some View {
        if viewModel.user.isCurrentUser {
            // edit profile button
            Button(action: {
                
            }, label: {
                Text("Edit profile")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(.black)
                    .frame(width: 360, height: 32, alignment: .center)
                    .overlay(
                        RoundedRectangle(cornerRadius: 3)
                            .stroke(Color.gray,lineWidth: 1)
                    )
        })
        } else {
            // follow and message button
            HStack {
                Button(action: {
                    isFollowed ? viewModel.unfollow() : viewModel.follow()
                }, label: {
                    Text(isFollowed ? "Following" : "Follow")
                        .font(.system(size: 14, weight: .semibold))
                        .frame(width: 172, height: 32, alignment: .center)
                        .foregroundColor(isFollowed ? .black : .white)
                        .background(isFollowed ? Color.white : Color.blue)

                        .overlay(
                            RoundedRectangle(cornerRadius: 3)
                                .stroke(Color.gray,lineWidth: isFollowed ? 1 : 0)
                        )
            })
                .cornerRadius(3)
                
                Button(action: {
                    
                }, label: {
                    Text("Message")
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(.black)
                        .frame(width: 172, height: 32, alignment: .center)
                        .overlay(
                            RoundedRectangle(cornerRadius: 3)
                                .stroke(Color.gray,lineWidth: 1)
                        )
            })
            }
        }
    }
}

//struct ProfileActionButtonView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfileActionButtonView()
//    }
//}
