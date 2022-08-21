//
//  UserView.swift
//  Twitter
//
//  Created by Park Junsuk on 2022/08/21.
//

import SwiftUI

struct UserRowView: View {
    var body: some View {
        HStack(spacing: 16) {
            Circle().frame(width: 48, height: 48)
            
            VStack(alignment: .leading) {
                Text("joker")
                    .font(.subheadline)
                    .foregroundColor(.black)
                    .bold()
                
                Text("Heath Ledger")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }.padding()
    }
}

struct UserRowView_Previews: PreviewProvider {
    static var previews: some View {
        UserRowView()
    }
}
