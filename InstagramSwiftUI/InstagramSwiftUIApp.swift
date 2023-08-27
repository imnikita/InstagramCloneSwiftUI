//
//  InstagramSwiftUIApp.swift
//  InstagramSwiftUI
//
//  Created by Nikita Popov on 10.07.2021.
//

import SwiftUI
import Firebase

@main
struct InstagramSwiftUIApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(AuthViewModel.shared)
        }
    }
}
