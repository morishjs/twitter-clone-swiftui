//
//  MainTab.swift
//  Twitter
//
//  Created by Park Junsuk on 2022/08/21.
//

import SwiftUI

struct MainTabView: View {
    @State private var selectedTabIndex = 0
    
    var body: some View {
        TabView(selection: $selectedTabIndex) {
           FeedView()
                .tabItem {
                    Image(systemName: "house")
                }.tag(0)
            
            ExploreView()
                 .tabItem {
                     Image(systemName: "magnifyingglass")
                 }.tag(1)

            NotificationView()
                 .tabItem {
                     Image(systemName: "bell")
                 }.tag(2)

            MessageView()
                 .tabItem {
                     Image(systemName: "envelope")
                 }.tag(3)

        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
