//
//  LoginView.swift
//  Twitter
//
//  Created by Park Junsuk on 2022/08/27.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text("Hello.")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                
                Text("Welcome back")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                
                HStack { Spacer() }
            }
            .frame(height: 260)
            .padding(.leading)
            .background(Color(.systemBlue))
            .foregroundColor(.white)
            .clipShape(RoundedShape(corners: [.bottomRight]))
            
            Spacer()
        }
        .ignoresSafeArea()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
