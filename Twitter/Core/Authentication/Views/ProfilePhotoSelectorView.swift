//
//  ProfilePhotoSelectorView.swift
//  Twitter
//
//  Created by Park Junsuk on 2022/09/10.
//

import SwiftUI

struct ProfilePhotoSelectorView: View {
    @State private var image: UIImage?
    @State private var showImagePicker = false
    @State private var profileImage: Image?
    @EnvironmentObject var viewModel: AuthViewModel
    
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
                showImagePicker.toggle()
            } label: {
                if let profileImage = profileImage {
                    profileImage
                        .resizable()
                        .modifier(ImageModifier())
                } else {
                    Circle()
                        .foregroundColor(Color(.systemBlue))
                        .modifier(ImageModifier())
                    
                }
            }
            .sheet(isPresented: $showImagePicker, onDismiss: loadImage, content: {
                ImagePicker(selectedImage: $image)
            })
            
            Button {
                if let selectedImage = image {
                    viewModel.uploadProfileImage(image: selectedImage)
                }
            } label: {
                if profileImage != nil {
                    Text("Continue")
                }
                
            }
            
            Spacer()
        }
    }
    
    func loadImage() {
        guard let selectedImage = image else { return }
        profileImage = Image(uiImage: selectedImage)
    }
}

private struct ImageModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .scaledToFill()
            .frame(width: 100, height: 100)
            .clipShape(Circle())
    }
}

struct ProfilePhotoSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePhotoSelectorView()
    }
}
