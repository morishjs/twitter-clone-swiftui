//
//  SideMenuRowView.swift
//  Twitter
//
//  Created by Park Junsuk on 2022/08/22.
//

import SwiftUI

struct SideMenuRowView: View {
    var viewModel: SideViewModel
    
    var body: some View {
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

struct SideMenuRowView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuRowView(viewModel: .profile)
    }
}
