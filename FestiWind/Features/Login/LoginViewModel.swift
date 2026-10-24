//
//  LoginViewModel.swift
//  FestiWind
//
//  Created by Apprenant 77 on 15/09/2026.
//

import SwiftUI

@Observable
final class LoginViewModel {
    let apiClient = APIClient()
    var email: String = ""
    var password: String = ""
    var errorMessage: String? = nil
    var isAuthenticated: Bool = false
    var isLoading: Bool = false
    
    func login() async throws {
        isLoading = true
        defer {
            isLoading = false
        }
        do {
            // Stuff
            try await apiClient.login(email: email, password: password)
            isAuthenticated = true
            
        }
        catch {
            errorMessage = "Login failed"
            isAuthenticated = false
            isLoading = false
        }
    }
}
