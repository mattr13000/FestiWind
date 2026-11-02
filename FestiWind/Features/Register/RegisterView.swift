//
//  RegisterView.swift
//  FestiWind
//
//  Created by Apprenant 77 on 15/09/2026.
//

import SwiftUI

struct RegisterView: View {
    @Environment(AuthManager.self) var authManager
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var passwordConfirm: String = ""
    var body: some View {
        NavigationStack {
        ZStack {
            HomeBackgroundImageView()
                VStack {
                    Spacer()
                    VStack(spacing: 20) {
                        TextFieldView(
                            textFieldContent: $name,
                            placeholderText: .commonNamePlaceholder,
                            frameMaxWidth: 330,
                            isSecure: false
                        )
                        TextFieldView(
                            textFieldContent: $email,
                            placeholderText: .commonEmailPlaceholder,
                            frameMaxWidth: 330,
                            isSecure: false
                        )
                        TextFieldView(
                            textFieldContent: $password,
                            placeholderText: .commonPasswordPlaceholder,
                            frameMaxWidth: 330,
                            isSecure: true
                        )
                        TextFieldView(
                            textFieldContent: $passwordConfirm,
                            placeholderText: .commonPwConfirmPlaceholder,
                            frameMaxWidth: 330,
                            isSecure: true
                        )
                    }
                    Spacer()
                    GlassButtonView(
                        buttonText: .authRegister,
                        frameMaxWidth: 280,
                        opacity: 0.3,
                        textColor: .textPrimary,
                        backgroundColor: .buttonColorActive
                    )
                    {
                        Task {
                            await authManager.register(
                                name: name,
                                email: email,
                                password: password,
                                passwordConfirm: passwordConfirm
                            )
                        }
                    }
                    Spacer()
                }
                .navigationTitle(.authRegister)
                
            }
            
        }
        
    }
}

#Preview {
    RegisterView()
        .environment(AuthManager())
}
