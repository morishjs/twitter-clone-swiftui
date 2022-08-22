//
//  UserStatsView.swift
//  Twitter
//
//  Created by Park Junsuk on 2022/08/22.
//

import SwiftUI

struct UserStatsView: View {
    var body: some View {
        HStack(spacing: 24) {
            HStack(spacing: 4) {
                Text("807")
                    .font(.subheadline)
                    .bold()
                Text("Following")
                    .foregroundColor(Color(.gray))
            }
            
            HStack(spacing: 4) {
                Text("6.9M")
                    .font(.subheadline)
                    .bold()
                Text("followers").foregroundColor(Color(.gray))
                
            }
        }
        .font(.caption)
    }
}

struct UserStatsView_Previews: PreviewProvider {
    static var previews: some View {
        UserStatsView()
    }
}
