//
//  ResetPasswordView.swift
//  InstagramSwiftUI
//
//  Created by Nikita Popov on 11.07.2021.
//

import SwiftUI

struct ResetPasswordView: View {
    // MARK: - Properties
    @EnvironmentObject var viewModel: AuthViewModel
    @Binding var email: String
    @Environment(\.presentationMode) var mode
    
    init(email: Binding<String>) {
        self._email = email
    }
    
    // MARK: - Body
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.purple, Color.blue]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack {
                Image("insta")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 220, height: 100, alignment: .center)
                
                VStack(spacing: 20) {
                    // Email Field
                    CustomTextField(text: $email, placeholder: Text("Email"), imageName: "envelope")
                        .padding()
                        .background(
                            Color(.init(white: 1, alpha: 0.15))
                        )
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .padding(.horizontal, 32)
                }
                
                // sign in
                Button(action: {
                    viewModel.resetPassword(with: email)
                }, label: {
                    Text("Send reset password link")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 323, height: 50)
                        .background(
                            Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1))
                        )
                        .clipShape(Capsule())
                        .padding()
                })
                
                Spacer()
                // go to sign up
                
                Button(action: {
                    mode.wrappedValue.dismiss()
                }, label: {
                    HStack {
                        Text("Already have an account?")
                            .font(.system(size: 14))
                        
                        Text("Sign In")
                            .font(.system(size: 14, weight: .semibold))
                        
                    }.foregroundColor(.white)
                })
                .padding(.bottom, 16)
            }
        } // VStack
        .padding(.top, -44)
        .onReceive(viewModel.$didSendResetPasswordLink, perform: { _ in
            self.mode.wrappedValue.dismiss()
        })
    }
    
}

//struct ResetPasswordView_Previews: PreviewProvider {
//    static var previews: some View {
//        ResetPasswordView()
//    }
//}
