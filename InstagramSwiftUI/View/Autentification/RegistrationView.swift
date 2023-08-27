//
//  RegistrationView.swift
//  InstagramSwiftUI
//
//  Created by Nikita Popov on 11.07.2021.
//

import SwiftUI

struct RegistrationView: View {
    // MARK: - Properties
    @State private var email = ""
    @State private var fullName = ""
    @State private var userName = ""
    @State private var password = ""
    @State private var selectedImage: UIImage?
    @State private var postImage: Image?
    @State private var imagePickerPresented = false
    @Environment(\.presentationMode) var mode
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    // MARK: - Body
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.purple, Color.blue]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack {
                ZStack {
                    if let image = postImage {
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 140, height: 140, alignment: .center)
                            .clipShape(Circle())
                    } else {
                        Button(action: {
                            imagePickerPresented.toggle()
                        }, label: {
                            Image(systemName: "plus.circle")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 140, height: 140, alignment: .center)
                                .foregroundColor(.white)
                        })
                        .sheet(isPresented: $imagePickerPresented, onDismiss: loadImage, content: {
                            ImagePicker(image: $selectedImage)
                        })
                        .padding()
                    }
                }
                
                
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
                    
                    CustomTextField(text: $userName, placeholder: Text("User name"), imageName: "person")
                        .padding()
                        .background(
                            Color(.init(white: 1, alpha: 0.15))
                        )
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .padding(.horizontal, 32)
                    
                    CustomTextField(text: $fullName, placeholder: Text("Full name"), imageName: "person")
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
                    
                    // sign up
                    Button(action: {
                        viewModel.register(withEmail: email, password: password, image: selectedImage, fullName: fullName, userName: userName)
                    }, label: {
                        Text("Sign Up")
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
        }
    }
}

extension RegistrationView {
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        postImage = Image(uiImage: selectedImage)
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
