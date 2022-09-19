//
//  UserView.swift
//  Twitter
//
//  Created by Park Junsuk on 2022/08/21.
//

import SwiftUI
import Kingfisher

struct UserRowView: View {
    private var user: User

    init(_ user: User) {
        self.user = user
    }
    var body: some View {
        HStack(spacing: 16) {
            KFImage(URL(string: user.profile_image))
                .resizable()
                .scaledToFill()
                .clipShape(Circle())
                .frame(width: 48, height: 48)
            
            VStack(alignment: .leading) {
                Text(user.username)
                    .font(.subheadline)
                    .foregroundColor(.black)
                    .bold()
                
                Text(user.fullname)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }.padding()
    }
}

//struct UserRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        UserRowView()
//    }
//}
