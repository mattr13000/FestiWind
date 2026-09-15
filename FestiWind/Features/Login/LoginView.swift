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
                            TextFieldView(textFieldContent: $email, frameMaxWidth: 330)
                            SecureField("Password", text: $password)
                                .padding()
                                .background(.white)
                                .cornerRadius(5)
                                .frame(maxWidth: 330)
                                .shadow(color: .textSecondary, radius: 1, x: 0, y: 1)
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
