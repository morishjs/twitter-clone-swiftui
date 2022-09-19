//
//  ExploreView.swift
//  Twitter
//
//  Created by Park Junsuk on 2022/08/21.
//

import SwiftUI

struct ExploreView: View {
    @ObservedObject var viewModel = ExploreViewModel()
    
    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading) {
                ForEach(viewModel.users, id: \.id) { user in
                    NavigationLink {
                        //                            ProfileView()
                    } label: {
                        UserRowView(user)
                    }
                }
            }
        }
        .navigationTitle("Explore")
        .navigationBarTitleDisplayMode(.inline)
    }
    
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}
