//
//  ImageUploader.swift
//  Twitter
//
//  Created by Park Junsuk on 2022/09/12.
//

import Foundation
import FirebaseStorage
import UIKit
import SwiftUI

struct ImageUploader {
    func upload(image: Image, completion: @escaping(_: String) -> Void) {
        guard let imageData = image.jpegData(compressionQuality: 0.5) else { return }
        
        let fileName = NSUUID().uuidString
        let ref = Storage.storage().reference(withPath: "/profile_image/\(fileName)")

        ref.putData(imageData, metadata: nil) { _, error in
            if error != nil {
                return
            } else {
                ref.downloadURL { imageUrl, _ in
                    guard let imageUrl  = imageUrl?.absoluteString else { return }
                    completion(imageUrl)
                }
            }
        }
    }
}
