//
//  AuthManager.swift
//  FestiWind
//
//  Created by Apprenant 77 on 27/10/2026.
//

import SwiftUI

@MainActor
@Observable
final class AuthManager {
    var authState: AuthState = .unknown
    var jwtToken: String?
    var errorMessage: LocalizedStringResource?
    var isLoggingIn: Bool = false
    
    private let apiClient = APIClient()
    private let minLoginDuration: Duration = .milliseconds(800)
    

    
    func login(email: String, password: String) async throws {
        isLoggingIn = true
        
        async let minDelay = Task.sleep(for: minLoginDuration)
        
        defer {
            isLoggingIn = false
        }
        do {
            let token = try await apiClient.login(email: email, password: password)
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
    
    func checkStatus() async {
        authState = .checking
        
        async let minDelay = Task.sleep(for: minLoginDuration)
        
        do {
            jwtToken = try await KeychainManager.getToken()
        }
        catch {
            jwtToken = nil
        }
        
        try? await minDelay
        
        authState = jwtToken == nil ? .unauthenticated : .authenticated
    }
    
}
