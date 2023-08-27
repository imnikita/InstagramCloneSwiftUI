//
//  SearchViewModel.swift
//  InstagramSwiftUI
//
//  Created by Nikita Popov on 12.07.2021.
//

import SwiftUI
import Firebase

class SearchViewModel: ObservableObject {
    // MARK: - Properties
    @Published var users = [User]()
    
    init() {
        fetchUsers()
    }
    
    func fetchUsers() {
        COLLECTIONS_USERS.getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            self.users = documents.compactMap( { try? $0.data(as: User.self) } )
            
//            print(self.users)
        }
    }
    
    
    func filteredUsers(_ query: String) -> [User] {
        let lowercasedQuery = query.lowercased()
        return users.filter ({
            $0.username.lowercased().contains(lowercasedQuery) ||
                $0.fullname.lowercased().contains(lowercasedQuery)
        })
    }
    
}
