//
//  CustomInputView.swift
//  InstagramSwiftUI
//
//  Created by Nikita Popov on 13.07.2021.
//

import SwiftUI

struct CustomInputView: View {
    // MARK: - Properties
    @Binding var inputText: String
    var action: () -> ()
    
    // MARK: - Body
    var body: some View {
        VStack {
            Rectangle()
                .foregroundColor(Color(.separator))
                .frame(width: UIScreen.main.bounds.width, height: 0.75)
                .padding(.bottom, 8)
            
            HStack {
                TextField("Comments...", text: $inputText)
                    .textFieldStyle(PlainTextFieldStyle())
                    .frame(minHeight: 30)
                
                Button(action: action ){
                    Text("Send")
                        .bold()
                }
            }
            .padding(.horizontal)
        }
        .padding(.bottom, 8)
    }
}

//struct CustomInputView_Previews: PreviewProvider {
//    let action = () -> ()
//    static var previews: some View {
//        CustomInputView(inputText: .constant(""), action: action)
//    }
//}
