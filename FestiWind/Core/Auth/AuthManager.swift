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
    
    func checkStatus() async {
        do {
            let token = try await KeychainManager.getToken()
            if let token {
                authState = .authenticated
                jwtToken = token
            } else {
                authState = .unauthenticated
                jwtToken = nil
            }
        }
        catch {
            authState = .unauthenticated
            jwtToken = nil
            errorMessage = "No token, login required, redirecting."
        }
    }
}
