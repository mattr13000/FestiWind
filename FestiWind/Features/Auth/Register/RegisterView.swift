//
//  RegisterView.swift
//  FestiWind
//
//  Created by Apprenant 77 on 15/09/2026.
//

import SwiftUI

struct RegisterView: View {
    @Environment(AuthManager.self) var authManager
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
                            errorText: authManager.passwordConfirmError,
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
                        backgroundColor: authManager.isRegistering || authManager.isLoggingIn ? .buttonColorInactive : .buttonColorActive,
                        isLoading: authManager.isRegistering || authManager.isLoggingIn
                    )
                    {
                        Task {
                            await authManager.register(
                                name: registerForm.name,
                                email: registerForm.email,
                                password: registerForm.password,
                                passwordConfirm: registerForm.passwordConfirm
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
