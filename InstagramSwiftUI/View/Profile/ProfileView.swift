//
//  ProfileView.swift
//  InstagramSwiftUI
//
//  Created by Nikita Popov on 10.07.2021.
//

import SwiftUI

struct ProfileView: View {
    // MARK: - Properties
    @ObservedObject var viewModel: ProfileViewModel
    let user: User
    
    init(user: User) {
        self.user = user
        self.viewModel = ProfileViewModel(user: user)
    }
    
    // MARK: - Body
    var body: some View {
        ScrollView() {
            VStack(spacing: 32) {
                ProfileHeaderView(viewModel: viewModel)
                
                PostGridView(config: .profile(user.id ?? ""))
            } //VStack
            .padding(.top)
        }
    }
}

//struct ProfileView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfileView()
//    }
//}
