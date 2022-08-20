//
//  TweetRowView.swift
//  Twitter
//
//  Created by Park Junsuk on 2022/08/20.
//

import SwiftUI

struct TweetRowView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top, spacing: 12) {
                Circle()
                    .frame(width: 54, height: 54)
                    .foregroundColor(Color(.systemBlue))
                
                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        Text("Bruce Wayne")
                            .font(.subheadline).bold()
                        Text("@batman")
                            .foregroundColor(.gray)
                            .font(.caption)
                        Text("2w")
                            .foregroundColor(.gray)
                            .font(.caption)
                    }
                    
                    Text("Hello world")
                        .font(.subheadline)
                        .multilineTextAlignment(.leading)
                }
            }
            
            HStack {
                Button {
                    //
                } label: {
                    Image(systemName: "bubble.left")
                }

                Spacer()
                
                Button {
                    //
                } label: {
                    Image(systemName: "arrow.2.squarepath")
                }
                
                Spacer()
                
                Button {
                    //
                } label: {
                    Image(systemName: "heart")
                }
                
                Spacer()
                
                Button {
                    //
                } label: {
                    Image(systemName: "bookmark")
                }
            }
            .padding()
            .foregroundColor(.gray)
            
            Divider()
        }
        .padding()
    }
}

struct TweetRowView_Previews: PreviewProvider {
    static var previews: some View {
        TweetRowView()
    }
}
