//
//  CustomInputField.swift
//  Twitter
//
//  Created by Park Junsuk on 2022/09/03.
//

import SwiftUI

struct CustomInputField: View {
    let placeholder: String
    let imageName: String
    
    @Binding var text: String
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(Color(.darkGray))
                
                TextField(placeholder, text: $text)
            }

            Divider()
                .background(.gray)
        }
    }
}

struct CustomInputField_Previews: PreviewProvider {
    static var previews: some View {
        CustomInputField(placeholder: "placeholder", imageName: "envelope", text: .constant(""))
    }
}
