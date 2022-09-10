//
//  ProfilePhotoSelectorView.swift
//  Twitter
//
//  Created by Park Junsuk on 2022/09/10.
//

import SwiftUI

struct ProfilePhotoSelectorView: View {
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text("Create your account")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                
                Text("Select your photo")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                
                HStack { Spacer() }
            }
            .frame(height: 260)
            .padding(.leading)
            .background(Color(.systemBlue))
            .foregroundColor(.white)
            .clipShape(RoundedShape(corners: [.bottomRight]))
            
            Button {
                
            } label: {
                Circle()
                    .frame(width: 100, height: 100)
                    .foregroundColor(Color(.systemBlue))
            }
            
            Spacer()
        }
    }
}

struct ProfilePhotoSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePhotoSelectorView()
    }
}
