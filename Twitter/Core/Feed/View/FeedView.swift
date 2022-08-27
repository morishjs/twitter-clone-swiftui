//
//  FeedView.swift
//  Twitter
//
//  Created by Park Junsuk on 2022/08/20.
//

import SwiftUI

struct FeedView: View {
    @State private var showNewTweetView = false
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            ScrollView {
                LazyVStack {
                    ForEach(0 ... 30, id: \.self) { _ in
                        TweetRowView()
                    }
                }
            }
            
            Button {
               showNewTweetView = true
            } label: {
               Image("tweet")
                    .resizable()
                    .frame(width: 28, height: 28)
                    .offset()
            }
            .background(Color(.systemBlue))
            .foregroundColor(.white)
            .clipShape(Circle())
            .fullScreenCover(isPresented: $showNewTweetView) {
                NewTweetView()
            }
            .padding()
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
