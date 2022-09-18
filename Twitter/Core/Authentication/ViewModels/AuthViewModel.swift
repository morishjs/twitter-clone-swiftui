//
//  AuthViewModel.swift
//  Twitter
//
//  Created by Park Junsuk on 2022/09/04.
//

import Foundation
import Firebase
import UIKit

class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var didAuthenticated = false
    
    private var tempUserSession: FirebaseAuth.User?
    private let service = UserService()
    
    init() {
        userSession = Auth.auth().currentUser
        
    }
    
    func login(withEmail: String, password: String) {
        Auth.auth().signIn(withEmail: withEmail, password: password) { result, error in
            if error != nil {
                return
            }
            
            guard let user = result?.user else { return }
            self.userSession = user
        }
    }
    
    func register(withEmail: String, password: String, fullname: String, username: String) {
        Auth.auth().createUser(withEmail: withEmail, password: password) { result, error in
            if let error = error {
                print("DEBUG: \(error.localizedDescription)")
                return
            } else {
                guard let user = result?.user else { return }
                self.tempUserSession = user
                
                let data = ["email": withEmail, "username": username.lowercased(), "fullname": fullname, "uid": user.uid]
                Firestore.firestore().collection("users")
                    .document(user.uid)
                    .setData(data, completion: { _  in
                        self.didAuthenticated = true
                    })
            }
        }
    }
    
    func signOut() {
        userSession = nil
        try? Auth.auth().signOut()
    }
    
    func uploadProfileImage(image: UIImage) {
        guard let uid = tempUserSession?.uid else { return }
        ImageUploader().upload(image: image) { imageUrl in
            Firestore.firestore().collection("users")
                .document(uid)
                .updateData(["profile_image": imageUrl]) { _ in
                    self.userSession = self.tempUserSession
                }
        }
    }
}
