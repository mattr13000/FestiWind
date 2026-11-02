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

struct RegisterRequest: Encodable {
    let name: String
    let email: String
    let password: String
}
 
struct AuthResponse: Decodable {
    let token: String
}
 
struct AuthService {
    private let webService = WebService()
 
    func login(email: String, password: String) async throws -> String {
        let response: AuthResponse = try await webService.request(
            "users/login",
            method: .post,
            body: LoginRequest(email: email, password: password)
        )
        return response.token
    }
    
    func getProfile() async throws -> User {
        let response: UserDTO = try await webService.request("users/profile", requiresAuth: true)
        return User(response)
    }
    
    func register(name: String, email: String, password: String) async throws {
        let _: UserDTO = try await webService.request(
            "users/register",
            method: .post,
            body: RegisterRequest(name: name, email: email, password: password)
        )
    }
}

