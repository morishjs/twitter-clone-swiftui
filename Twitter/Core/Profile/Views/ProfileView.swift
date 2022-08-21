//
//  ProfileView.swift
//  Twitter
//
//  Created by Park Junsuk on 2022/08/21.
//

import SwiftUI

struct ProfileView: View {
    @State private var selectedTab = TweetFilterViewModel.tweets
    @Namespace private var animation
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack(alignment: .leading) {
            headerView
            actionButtons
            profileInfo
            tabs
            tweetView
            
            Spacer()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

extension ProfileView {
    var headerView: some View {
        ZStack(alignment: .bottomLeading) {
            Color(.systemBlue)
                .ignoresSafeArea()
            
            VStack {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "arrow.left")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundColor(.white)
                        .offset(x: 8, y: 8)
                }
                
                Circle()
                    .frame(width: 60, height: 60)
                    .offset(x: 12, y: 24)
            }
        }
        .frame(height: 96)
    }
    
    var actionButtons: some View {
        HStack(spacing: 12) {
            Spacer()
            
            Image(systemName: "bell.badge")
                .font(.title3)
                .padding(6)
                .overlay(Circle().stroke(Color.gray, lineWidth: 0.75))
            
            Button {
                
            } label: {
                Text("Edit Profile")
                    .font(.subheadline)
                    .bold()
                    .foregroundColor(.black)
                    .frame(width: 120, height: 32)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20).stroke(Color.gray, lineWidth: 0.75))
            }
        }
        .padding(.trailing)
    }
    
    var profileInfo: some View{
        VStack(alignment: .leading, spacing: 4)
        {
            HStack {
                Text("Heath Ledger")
                    .font(.title2)
                    .bold()
                
                Image(systemName: "checkmark.seal.fill")
                    .foregroundColor(Color(.systemBlue))
            }
            
            Text("@joker")
                .font(.subheadline)
                .foregroundColor(.gray)
            
            Text("Your moms favorite villain")
                .font(.subheadline)
                .padding(.vertical)
            
            HStack(spacing: 32) {
                HStack {
                    Image(systemName: "mappin.and.ellipse")
                    Text("Gotham, NY")
                }
                HStack {
                    Image(systemName: "link")
                    Text("www.naver.com")
                }
            }
            .foregroundColor(Color(.gray))
            .font(.caption)
            
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
            .padding(.vertical)
        }
        .padding(.horizontal)
    }
    
    var tabs: some View {
        HStack {
            ForEach(TweetFilterViewModel.allCases, id: \.rawValue) { item in
                VStack {
                    Text(item.title)
                        .font(.subheadline)
                        .fontWeight(selectedTab == item ? .bold : .regular)
                        .foregroundColor(selectedTab == item ? .black : .gray)
                    
                    if (selectedTab == item) {
                        Capsule()
                            .frame(height: 3)
                            .foregroundColor(Color(.systemBlue))
                            .matchedGeometryEffect(id: "filter", in: animation)
                    } else {
                        Capsule()
                            .frame(height: 3)
                            .foregroundColor(Color(.clear))
                    }
                }
                .onTapGesture {
                    withAnimation(.easeInOut)  {
                        selectedTab = item
                    }
                }
            }
        }
    }
    
    var tweetView: some View {
        ScrollView {
            LazyVStack {
                ForEach(0 ... 9, id: \.self) { _ in
                    TweetRowView()                    }
            }
        }
    }
}
