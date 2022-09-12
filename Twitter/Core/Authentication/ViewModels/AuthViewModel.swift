//
//  AuthViewModel.swift
//  Twitter
//
//  Created by Park Junsuk on 2022/09/04.
//

import Foundation
import Firebase

class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    
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
                self.userSession = user
                
                let data = ["email": withEmail, "username": username.lowercased(), "fullname": fullname, "uid": user.uid]
                Firestore.firestore().collection("users")
                    .document(user.uid)
                    .setData(data, completion: { _  in
                       print("DEBUG")
                    })
            }
        }
    }
    
    func signOut() {
        userSession = nil
        try? Auth.auth().signOut()
    }
}
