//
//  SideMenuView.swift
//  Twitter
//
//  Created by Park Junsuk on 2022/08/22.
//

import SwiftUI

struct SideMenuView: View {
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                Circle()
                    .frame(width: 32, height: 32)
                
                Text("Bruce Wayne")
                    .font(.headline)
                Text("@batman")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            
            UserStatsView()
                .padding(.vertical)
            
            VStack(spacing: 16) {
                ForEach(SideViewModel.allCases, id: \.rawValue) { viewModel in
                    HStack(spacing: 16) {
                        Image(systemName: viewModel.imageName)
                            .foregroundColor(.gray)
                            .font(.subheadline)
                        
                        Text(viewModel.title)
                            .font(.subheadline)
                        Spacer()
                    }
                    .frame(height: 40)
                }
            }
            .padding(.vertical)
            
            Spacer()
        }
        .padding(.horizontal)
    }
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView()
    }
}
