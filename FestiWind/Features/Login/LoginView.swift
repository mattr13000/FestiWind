//
//  LoginView.swift
//  FestiWind
//
//  Created by Apprenant 77 on 14/09/2026.
//

import SwiftUI

struct LoginView: View {
    @Environment(AuthManager.self) var authManager
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        ZStack {
                    HomeBackgroundImageView()
                    VStack {
                        Spacer()
                        Text(.appTitle)
                            .font(.custom("Shalimar-Regular", size: 80))
                            .padding(.bottom, 60)
                        VStack (spacing: 16){
                            TextFieldView(textFieldContent: $email, placeholderText: .commonEmailPlaceholder, frameMaxWidth: 330, isSecure: false)
                            TextFieldView(textFieldContent: $password, placeholderText: .commonPasswordPlaceholder, frameMaxWidth: 330, isSecure: true)
                            HStack {
                                TextButtonView(buttonText: .authForgotPasword)
                            }
                        }
                        Spacer()
                        Text(authManager.errorMessage ?? "")
                        GlassButtonView(
                            buttonText: .authLogin,
                            frameMaxWidth: 280,
                            opacity: 0.3,
                            textColor: .textPrimary,
                            backgroundColor: authManager.isLoggingIn ? .buttonColorInactive : .buttonColorActive)
                        {
                            Task {
                                await authManager.login(email: email, password: password)
                            }
                        }
                        .disabled(authManager.isLoggingIn)
                        HStack {
                            Text(.authNoAccountPrompt)
                                .font(.subheadline)
                                
                            Button {}
                            label: {
                                Text(.authRegister)
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
        .environment(AuthManager())
}
