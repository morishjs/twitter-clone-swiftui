//
//  ContentView.swift
//  Twitter
//
//  Created by Park Junsuk on 2022/08/20.
//

import SwiftUI
import Kingfisher

struct ContentView: View {
    @State private var showMenu = false
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        Group {
            if viewModel.userSession == nil {
                LoginView()
            } else {
                ZStack(alignment: .leading) {
                    MainTabView()
                    
                    if showMenu {
                        Color(.black).opacity(0.25)
                            .onTapGesture {
                                withAnimation(.easeInOut) {
                                showMenu = false
                                }
                            }
                            .ignoresSafeArea()
                    }
                    
                    SideMenuView()
                        .frame(width: 300)
                        .offset(x: showMenu ? 0 : -300, y: 0)
                        .background(showMenu ? .white : .clear)
                }
                .navigationTitle("Home")
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarHidden(showMenu)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        if let user = viewModel.currentUser {
                            Button {
                                withAnimation(.easeInOut) {
                                    showMenu = true
                                }
                            } label: {
                                KFImage(URL(string: user.profile_image))
                                    .resizable()
                                    .scaledToFill()
                                    .clipShape(Circle())
                                    .frame(width: 32, height: 32)
                            }
                        }
                    }
                }
                .onAppear {
                    showMenu = false
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ContentView()
        }
    }
}
