//
//  AuthService.swift
//  FestiWind
//
//  Created by Apprenant 77 on 28/10/2026.
//

import Foundation
 
struct LoginRequest: Encodable {
    let email: String
    let password: String
}
 
struct AuthResponse: Decodable {
    let token: String
}
 
struct AuthService {
    private let api = APIClient()
 
    func login(email: String, password: String) async throws -> String {
        let response: AuthResponse = try await api.request(
            "users/login",
            method: .post,
            body: LoginRequest(email: email, password: password)
        )
        return response.token
    }
}

