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
    var jwtToken: String?
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
    
    func checkStatus() async {
        authState = .checking
        
        async let minDelay = Task.sleep(for: minDuration)
        
        do {
            jwtToken = try await KeychainManager.getToken()
        }
        catch {
            jwtToken = nil
        }
        
        try? await minDelay
        
        authState = jwtToken == nil ? .unauthenticated : .authenticated
    }
    
    func login(email: String, password: String) async {
        isLoggingIn = true
        errorMessage = nil
        
        async let minDelay = Task.sleep(for: minDuration)
        
        defer {
            isLoggingIn = false
        }
        do {
            let token = try await authService.login(email: email, password: password)
            try await KeychainManager.saveToken(token: token)
            jwtToken = token
        }
        catch {
            errorMessage = .authErrorLoginFailed
        }
        
        try? await minDelay
        
        if jwtToken != nil {
            authState = .authenticated
        }
    }
    
    func logout() async {
        do {
            try await KeychainManager.deleteToken()
            authState = .unauthenticated
            jwtToken = nil
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
            return nameTooShortError = "Name must be at least 4 characters"
        }

        guard email.isValidEmail else {
            return emailNotValidError = "Invalid email"
        }

        guard password.count > 7 else {
            return passwordError = "Password must be at least 8 characters long"
        }

        guard password == passwordConfirm else {
            return passwordConfirmError = "Passwords must be identical"
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
