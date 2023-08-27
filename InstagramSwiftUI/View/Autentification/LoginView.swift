//
//  LoginView.swift
//  InstagramSwiftUI
//
//  Created by Nikita Popov on 11.07.2021.
//

import SwiftUI

struct LoginView: View {
    // MARK: - Properties
    @State private var email = ""
    @State private var password = ""
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    // MARK: - Body
    var body: some View {
        NavigationView {
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
                        
                        // Password Field
                        CustomSecureField(text: $password, placeholder: Text("Password"))
                            .padding()
                            .background(
                                Color(.init(white: 1, alpha: 0.15))
                            )
                            .cornerRadius(10)
                            .foregroundColor(.white)
                            .padding(.horizontal, 32)
                        
                        //forgot password
                        HStack {
                            Spacer()
                            
                            NavigationLink(
                                destination: ResetPasswordView(email: $email),
                                label: {
                                    Text("Forgot Password?")
                                        .foregroundColor(.white)
                                        .font(.system(size: 13, weight: .semibold))
                                })
                                .padding(.trailing, 23)
                        }
                        
                        // sign in
                        Button(action: {
                            viewModel.login(withEmail: email, password: password)
                        }, label: {
                            Text("Sign In")
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
                        
                        NavigationLink(
                            destination: RegistrationView().navigationBarHidden(true),
                            label: {
                                HStack {
                                    Text("Don't have an account?")
                                        .font(.system(size: 14))
                                    
                                    Text("Sign Up")
                                        .font(.system(size: 14, weight: .semibold))
                                    
                                }.foregroundColor(.white)
                            })
                            .padding(.bottom, 16)
                    }
                } // VStack
                .padding(.top, -44)
            } // ZStack
            
        } //NavigationView
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
