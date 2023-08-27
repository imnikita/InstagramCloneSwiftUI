//
//  ProfileHeaderView.swift
//  InstagramSwiftUI
//
//  Created by Nikita Popov on 11.07.2021.
//

import SwiftUI
import Kingfisher

struct ProfileHeaderView: View {
    // MARK: - Properties
    @ObservedObject var viewModel: ProfileViewModel
    
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                KFImage(URL(string: viewModel.user.profileImageURL))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 80, alignment: .center)
                    .clipShape(Circle())
                    .padding(.leading)
                
                Spacer()
                
                HStack(alignment: .center, spacing: 16) {
                    UserStackView(value: viewModel.user.stats?.posts ?? 0, title: "Posts")
                    UserStackView(value: viewModel.user.stats?.followers ?? 0, title: "Followers")
                    UserStackView(value: viewModel.user.stats?.following ?? 0, title: "Following")

                } // HStack
                .padding(.trailing)
                
            } // HStack
            
            Text(viewModel.user.fullname)
                .font(.system(size: 15, weight: .semibold))
                .padding([.leading, .top])
            Text("Gotham's Dark knight || Billionaire")
                .font(.system(size: 15))
                .padding(.leading)
                .padding(.top, 1)
            
            HStack {
                Spacer()
 
                ProfileActionButtonView(viewModel: viewModel)
                
                Spacer()
            } //Button HStack
            .padding(.top)
                
        } //VStack
    }
}


//struct ProfileHeaderView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfileHeaderView()
//    }
//}
