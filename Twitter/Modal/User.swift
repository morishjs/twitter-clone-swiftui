//
//  User.swift
//  Twitter
//
//  Created by Park Junsuk on 2022/09/18.
//

import FirebaseFirestoreSwift

struct User: Identifiable, Decodable {
    @DocumentID var id: String?
    let username: String
    let fullname: String
    let profile_image: String
    let email: String
}
