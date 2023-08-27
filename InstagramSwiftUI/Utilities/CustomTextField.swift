//
//  CustomTextField.swift
//  InstagramSwiftUI
//
//  Created by Nikita Popov on 11.07.2021.
//

import SwiftUI

struct CustomTextField: View {
    // MARK: - Properties
    @Binding var text: String
    let placeholder: Text
    let imageName: String
    
    // MARK: - Body
    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty {
                placeholder
                    .foregroundColor(Color(.init(white: 1, alpha: 0.8)))
                    .padding(.leading, 40)
            }
            
            HStack {
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20, alignment: .center)
                    .foregroundColor(.white)
                
                TextField("", text: $text)
            }
        }
    }
}

// MARK: - Preview
struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextField(text: .constant(""), placeholder: Text("Email"), imageName: "envelope")
    }
}
