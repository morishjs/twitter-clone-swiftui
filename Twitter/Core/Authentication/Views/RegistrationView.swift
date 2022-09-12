//
//  RegistrationView.swift
//  Twitter
//
//  Created by Park Junsuk on 2022/08/27.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var fullname = ""
    @State private var username = ""
    
    @EnvironmentObject var authViewModel: AuthViewModel
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text("Get Started.")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                
                Text("Create your account")
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
                CustomInputField(placeholder: "Enter an email", imageName: "envelope", text: $email)
                CustomInputField(placeholder: "Enter a username", imageName: "person", text: $username)
                CustomInputField(placeholder: "Enter an fullname", imageName: "person", text: $fullname)
                CustomInputField(placeholder: "Enter a password", imageName: "lock", text: $password)
            }
            .padding(32)
            
            Button {
                authViewModel.register(withEmail: email, password: password, fullname: fullname, username: username)
            } label: {
                Text("Sign Up")
                    .font(.headline)
                    .foregroundColor(Color(.white))
                    .frame(width: 340, height: 60)
                    .background(Color(.systemBlue))
                    .clipShape(Capsule())
            }
            
            Spacer()
            
            Button {
                dismiss()
            } label: {
                HStack {
                    Text("You already have an account?")
                        .fontWeight(.semibold)
                        .foregroundColor(Color(.systemBlue))
                    
                    Text("Sign In")
                        .fontWeight(.bold)
                        .foregroundColor(Color(.systemBlue))
                }
            }
            .padding(.bottom)
        }
        .ignoresSafeArea()
        
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
