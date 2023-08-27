//
//  AuthViewModel.swift
//  InstagramSwiftUI
//
//  Created by Nikita Popov on 11.07.2021.
//

import SwiftUI
import Firebase

class AuthViewModel: ObservableObject {
    // MARK: - Properties
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    @Published var didSendResetPasswordLink: Bool = false
    
    static let shared = AuthViewModel()
    
    init() {
        userSession = Auth.auth().currentUser
        fetchUser()
    }
    
    // MARK: - Methods
    func login(withEmail email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: login error \(error.localizedDescription)")
                return
            }
            
            guard let user = result?.user else { return }
            self.userSession = user
            self.fetchUser()
        }
    }
    
    func register(withEmail email: String, password: String, image: UIImage?,
                  fullName: String, userName: String) {
        
        guard let image = image else { return }
        
        ImageUploader.uploadImage(image: image, type: .profile) { imageUrl in
            Auth.auth().createUser(withEmail: email, password: password) { result, error in
                if let error = error {
                    print(error.localizedDescription)
                    return
                }
                
                guard let user = result?.user else { return }
                print("User is registered...")
                
                let data = ["email" : email,
                            "username" : userName,
                            "fullname" : fullName,
                            "profileImageURL" : imageUrl,
                            "uid" : user.uid
                            ]
                COLLECTIONS_USERS.document(user.uid).setData(data) { _ in
                    print("Successfully uploaded user data...")
                    self.userSession = user
                    self.fetchUser()
                }
            }
        }
    }
    
    func signout() {
        self.userSession = nil
        try? Auth.auth().signOut()
        print("signed out")
    }
    
    func resetPassword(with email: String) {
        Auth.auth().sendPasswordReset(withEmail: email) { error in
            if let error = error {
                print("Failed to send link with reset: \(error.localizedDescription)")
                return
            }
            print(" Link sent successfully.")
            self.didSendResetPasswordLink = true
        }
    }
    
    func fetchUser() {
        guard let uid = userSession?.uid else { return }
        COLLECTIONS_USERS.document(uid)
            .getDocument { snapshot, _ in
                guard let user = try? snapshot?.data(as: User.self) else { return }
                self.currentUser = user
               
        }
    }
    
}
