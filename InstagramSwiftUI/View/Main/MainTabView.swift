//
//  MainTabView.swift
//  InstagramSwiftUI
//
//  Created by Nikita Popov on 10.07.2021.
//

import SwiftUI

struct MainTabView: View {
    // MARK: - Properties
    let user: User
    @Binding var selectedIndex: Int
    
    // MARK: - Body
    var body: some View {
        NavigationView {
            TabView(selection: $selectedIndex) {
                // MARK: - FeedView
                FeedView()
                    .onTapGesture {
                        selectedIndex = 0
                    }
                    .tabItem {
                        Image(systemName: "house")
                    }.tag(0)
                
                // MARK: - SearchView
                SearchView()
                    .onTapGesture {
                        selectedIndex = 1
                    }
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                    }.tag(1)
                
                // MARK: - UploadPostsView
                UploadPostView(tabIndex: $selectedIndex)
                    .onTapGesture {
                        selectedIndex = 2
                    }
                    .tabItem {
                        Image(systemName: "plus.square")
                    }.tag(2)
                
                // MARK: - UploadPostsView
                NotificationsView()
                    .onTapGesture {
                        selectedIndex = 3
                    }
                    .tabItem {
                        Image(systemName: "heart")
                    }.tag(3)
                
                // MARK: - ProfileView
                ProfileView(user: user)
                    .onTapGesture {
                        selectedIndex = 4
                    }
                    .tabItem {
                        Image(systemName: "person")
                    }.tag(4)
                
            } //TabView
            .navigationTitle(tabTitle)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading: logoutButton)
            .accentColor(.black)
        }
    }
    
    var logoutButton: some View {
        Button {
            AuthViewModel.shared.signout()
        } label: {
            Text("Logout")
                .foregroundColor(.black)
        }

    }
    
    var tabTitle: String {
        switch selectedIndex {
        case 0: return "Feed"
        case 1: return "Explore"
        case 2: return "New post"
        case 3: return "Notifications"
        case 4: return "Profile"
        default:
            return "Home"
        }
    }
}

//struct MainTabView_Previews: PreviewProvider {
//    static var previews: some View {
//        MainTabView()
//    }
//}
