//
//  RegisterView.swift
//  FestiWind
//
//  Created by Apprenant 77 on 15/09/2026.
//

import SwiftUI

struct RegisterView: View {
    @Environment(AuthManager.self) var authManager
    @Environment(\.dismiss) var dismiss
    @State private var registerForm: RegisterForm = RegisterForm()
    
    var body: some View {
        NavigationStack {
        ZStack {
            HomeBackgroundImageView()
                VStack {
                    Spacer()
                    VStack(spacing: 20) {
                        TextFieldView(
                            textFieldContent: $registerForm.name,
                            placeholderText: .commonNamePlaceholder,
                            errorText: authManager.nameTooShortError,
                            frameMaxWidth: 330,
                            isSecure: false
                        )
                        TextFieldView(
                            textFieldContent: $registerForm.email,
                            placeholderText: .commonEmailPlaceholder,
                            errorText: authManager.emailNotValidError,
                            frameMaxWidth: 330,
                            isSecure: false
                        )
                        TextFieldView(
                            textFieldContent: $registerForm.password,
                            placeholderText: .commonPasswordPlaceholder,
                            errorText: authManager.passwordError,
                            frameMaxWidth: 330,
                            isSecure: true
                        )
                        TextFieldView(
                            textFieldContent: $registerForm.passwordConfirm,
                            placeholderText: .commonPwConfirmPlaceholder,
                            frameMaxWidth: 330,
                            isSecure: true
                        )
                    }
                    Spacer()
                        Text(authManager.registerState ?? .placeholder)
                            .opacity(authManager.registerState == nil ? 0 : 1)
                            .accessibilityHidden(authManager.registerState == nil)
                    Spacer()
                    GlassButtonView(
                        buttonText: .authRegister,
                        frameMaxWidth: 280,
                        opacity: 0.3,
                        textColor: .textPrimary,
                        backgroundColor: authManager.isRegistering ? .buttonColorInactive : .buttonColorActive
                    )
                    {
                        Task {
                            do {
                                try await authManager.register(
                                    name: registerForm.name,
                                    email: registerForm.email,
                                    password: registerForm.password,
                                    passwordConfirm: registerForm.passwordConfirm
                                )
                                registerForm = RegisterForm()
                                try await Task.sleep(nanoseconds: 1_000_000_000)
                                dismiss()
                            } catch {
                                authManager.registerState = .authErrorRegisterFailed
                            }
                        }
                    }
                    .disabled(authManager.isRegistering)
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
