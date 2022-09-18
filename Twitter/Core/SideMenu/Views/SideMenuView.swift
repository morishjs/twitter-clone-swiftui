//
//  SideMenuView.swift
//  Twitter
//
//  Created by Park Junsuk on 2022/08/22.
//

import SwiftUI
import Kingfisher

struct SideMenuView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    
    var body: some View {
        if let user = authViewModel.currentUser  {
            VStack(alignment: .leading) {
                VStack(alignment: .leading) {
                    KFImage(URL(string: user.profile_image))
                        .resizable()
                        .scaledToFill()
                        .clipShape(Circle())
                        .frame(width: 32, height: 32)
                    
                    Text(authViewModel.currentUser?.fullname ?? "")
                        .font(.headline)
                    Text("@\(user.username)")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                
                UserStatsView()
                    .padding(.vertical)
                
                VStack(spacing: 16) {
                    ForEach(SideViewModel.allCases, id: \.rawValue) { viewModel in
                        if viewModel == .profile {
                            NavigationLink {
                                ProfileView(user)
                            } label: {
                                SideMenuRowView(viewModel: viewModel)
                            }
                            .foregroundColor(.black)
                        } else if viewModel == .logout {
                            Button {
                                authViewModel.signOut()
                            } label: {
                                SideMenuRowView(viewModel: viewModel)
                            }
                        } else {
                            SideMenuRowView(viewModel: viewModel)
                        }
                    }
                }
                .padding(.vertical)
                
                Spacer()
            }
            .padding(.horizontal)
        }
    }
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView()
    }
}
