//
//  TextArea.swift
//  Twitter
//
//  Created by Park Junsuk on 2022/08/27.
//

import SwiftUI

struct TextArea: View {
    @Binding var text: String
    let placeholder: String
    
    init(text: Binding<String>, placeholder: String) {
        self._text = text
        self.placeholder = placeholder
        
        UITextView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            if text.isEmpty {
                Text(placeholder)
                    .foregroundColor(Color(.placeholderText))
                    .padding(.horizontal, 8)
                    .padding(.vertical, 12)
            }
            
            TextEditor(text: _text)
                .padding(4)
                .font(.body)
        }
    }
}

