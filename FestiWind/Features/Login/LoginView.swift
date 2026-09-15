//
//  LoginView.swift
//  FestiWind
//
//  Created by Apprenant 77 on 14/09/2026.
//

import SwiftUI

struct LoginView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        ZStack {
                    HomeBackgroundImageView()
                    VStack {
                        Spacer()
                        Text("Festi Wind")
                            .font(.custom("Shalimar-Regular", size: 80))
                            .padding(.bottom, 60)
                        VStack (spacing: 16){
                            TextFieldView(textFieldContent: $email, placeholderText: "Email", frameMaxWidth: 330, isSecure: false)
                            TextFieldView(textFieldContent: $password, placeholderText: "Password", frameMaxWidth: 330, isSecure: true)
                            HStack {
                                TextButtonView(buttonText: "Forgot Password ?")
                            }
                        }
                        Spacer()
                        GlassButtonView(buttonText: "Log In", frameMaxWidth: 280, opacity: 0.3, textColor: .textPrimary, backgroundColor: .buttonColorActive)
                        HStack {
                            Text("Don't have an account yet ?")
                                .font(.subheadline)
                                
                            Button {}
                            label: {
                                Text("Register")
                                    .font(.subheadline)
                                    .underline()
                                    .foregroundStyle(.textLink)
                            }
                        }
                        Spacer()
                    }
                }
    }
}

#Preview {
    LoginView()
}
