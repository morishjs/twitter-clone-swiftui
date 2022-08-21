//
//  TweetFilterViewModel.swift
//  Twitter
//
//  Created by Park Junsuk on 2022/08/21.
//

import Foundation

enum TweetFilterViewModel: Int, CaseIterable {
    case tweets
    case replies
    case likes
    
    var title: String {
        switch self {
        case .tweets: return "Tweets"
        case .likes: return "Likes"
        case .replies: return "Replies"
        }
    }
}
