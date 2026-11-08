//
//  AuthManager.swift
//  FestiWind
//
//  Created by Apprenant 77 on 27/10/2026.
//

import SwiftUI

@Observable
final class AuthManager {
    var authState: AuthState = .unknown
    var errorMessage: LocalizedStringResource?
    
    var registerState: LocalizedStringResource?
    
    var nameTooShortError: LocalizedStringResource?
    var emailNotValidError: LocalizedStringResource?
    var passwordError: LocalizedStringResource?
    var passwordConfirmError: LocalizedStringResource?

    var isLoggingIn: Bool = false
    var isRegistering: Bool = false
    
    private let authService = AuthService()
    private let minDuration: Duration = .milliseconds(800)
    
    func restoreSession() async {
        authState = .checking
        
        async let minDelay = Task.sleep(for: minDuration)
        
        var token: String?
        do {
            token = try await KeychainManager.getToken()
        }
        catch {
            token = nil
        }

        if token == nil {
            authState = .unauthenticated
        } else {
            do {
                _ = try await authService.getProfile()
                authState = .authenticated
            } catch {
                errorMessage = .authStatusUnauthenticated
                try? await KeychainManager.deleteToken()
                authState = .unauthenticated
            }
        }
        
        try? await minDelay
    }
    
    func login(email: String, password: String) async {
        isLoggingIn = true
        errorMessage = nil
        
        async let minDelay = Task.sleep(for: minDuration)
        
        defer {
            isLoggingIn = false
        }
        var loggedIn = false
        do {
            let token = try await authService.login(email: email, password: password)
            try await KeychainManager.saveToken(token: token)
            loggedIn = true
        }
        catch {
            errorMessage = .authErrorLoginFailed
        }

        try? await minDelay

        if loggedIn {
            authState = .authenticated
        }
    }
    
    func logout() async {
        do {
            try await KeychainManager.deleteToken()
            authState = .unauthenticated
        } catch {
            errorMessage = .authLogoutFail
        }
    }
    
    func register(name: String, email: String, password: String, passwordConfirm: String) async {
        nameTooShortError = nil
        emailNotValidError = nil
        passwordError = nil
        passwordConfirmError = nil
        registerState = nil

        guard name.count > 3 else {
            return nameTooShortError = .authErrorNameTooShort
        }

        guard email.isValidEmail else {
            return emailNotValidError = .authErrorInvalidEmail
        }

        guard password.count > 7 else {
            return passwordError = .authErrorPasswordTooShort
        }

        guard password == passwordConfirm else {
            return passwordConfirmError = .authErrorPasswordsMismatch
        }

        isRegistering = true

        async let minDelay = Task.sleep(for: minDuration)

        var registered = false
        do {
            try await authService.register(name: name, email: email, password: password)
            registered = true
        } catch {
            registerState = .authErrorRegisterFailed
        }
        try? await minDelay

        isRegistering = false

        if registered {
            await login(email: email, password: password)
        }
    }
}
