//
//  LoginView.swift
//  Twitter
//
//  Created by Park Junsuk on 2022/08/27.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    
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
            
            VStack(spacing: 40) {
                TextField("Email", text: $email)
                TextField("Password", text: $password)
            }
            .padding(.top, 44)
            .padding(.horizontal, 20)
            
            HStack {
                Spacer()
                NavigationLink {
                    Text("hello world")
                } label: {
                   Text("Forgot Password?")
                        .fontWeight(.semibold)
                        .foregroundColor(Color(.systemBlue))
                        .padding(.trailing)
                        .padding(.top)
                }
            }
            
            Button {
                
            } label: {
                Text("Sign In")
                    .font(.headline)
                    .foregroundColor(Color(.white))
                    .frame(width: 340, height: 60)
                    .background(Color(.systemBlue))
                    .clipShape(Capsule())
                    .padding(.top)
            }

            
            Spacer()
            
            HStack {
                NavigationLink {
                    
                } label: {
                    Text("Don't have an account?")
                        .fontWeight(.semibold)
                        .foregroundColor(Color(.systemBlue))
                }
                
                NavigationLink {
                    
                } label: {
                    Text("Sign Up")
                        .fontWeight(.bold)
                        .foregroundColor(Color(.systemBlue))
                }
            }
            .padding(.vertical)
        }
        .ignoresSafeArea()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
