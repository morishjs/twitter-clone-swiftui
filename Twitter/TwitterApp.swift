//
//  TwitterApp.swift
//  Twitter
//
//  Created by Park Junsuk on 2022/08/20.
//

import SwiftUI
import Firebase

@main
struct TwitterApp: App {
    @StateObject var authViewModel = AuthViewModel()
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
                    .environmentObject(authViewModel)
            }
        }
    }
}
