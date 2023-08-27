//
//  FeedView.swift
//  InstagramSwiftUI
//
//  Created by Nikita Popov on 10.07.2021.
//

import SwiftUI

struct FeedView: View {
    // MARK: - Properties
    @ObservedObject var viewModel = FeedViewModel()
    
    
    // MARK: - Body
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 32) {
                ForEach(viewModel.posts) { post in
                    FeedCell(viewModel: FeedCellViewModel(post: post))
                }
            }
            .padding(.top, 10)
        } //ScrollView
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
