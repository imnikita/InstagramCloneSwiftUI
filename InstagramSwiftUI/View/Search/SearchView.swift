//
//  SearchView.swift
//  InstagramSwiftUI
//
//  Created by Nikita Popov on 10.07.2021.
//

import SwiftUI

struct SearchView: View {
    // MARK: - Properties
    @State var searchText = ""
    @State var inSearchMode = false
    @ObservedObject var viewModel = SearchViewModel()
    
    // MARK: - Body
    var body: some View {
        
        ScrollView {
            
            // MARK: - SearchBar
            SearchBar(text: $searchText, isEditing: $inSearchMode)
                .padding()
            
            ZStack {
                if inSearchMode {
                    UserListView(viewModel: viewModel, searchText: $searchText)
                } else {
                    PostGridView(config: .explore)
                }
            }
            
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
