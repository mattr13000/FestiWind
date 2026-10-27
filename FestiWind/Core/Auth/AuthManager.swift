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
    var errorMessage: String?
    
    private let minLoginDuration: Duration = .milliseconds(800)
    
    func checkStatus() async {
        authState = .checking
        
        async let minDelay = Task.sleep(for: minLoginDuration)
        
        do {
            let token = try await KeychainManager.getToken()
        }
        catch {
            jwtToken = nil
            errorMessage = "No token, login required, redirecting."
        }
        
        try? await minDelay
        
        authState = jwtToken == nil ? .unauthenticated : .authenticated
    }
}
