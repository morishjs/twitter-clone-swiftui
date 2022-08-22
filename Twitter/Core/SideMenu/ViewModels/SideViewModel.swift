//
//  SideViewModel.swift
//  Twitter
//
//  Created by Park Junsuk on 2022/08/22.
//

import Foundation

enum SideViewModel: Int, CaseIterable {
    case profile
    case lists
    case bookmarks
    case logout
    
    var title: String {
        switch self {
        case .profile: return "profile"
        case .lists: return "lists"
        case .bookmarks: return "bookmarks"
        case .logout: return "logout"
        }
    }
    
    var imageName: String {
        switch self {
        case .profile: return "person"
        case .lists: return "list.bullet"
        case .bookmarks: return "bookmark"
        case .logout: return "arrow.left.square"
        }
    }
}
