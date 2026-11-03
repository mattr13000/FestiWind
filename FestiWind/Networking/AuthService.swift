//
//  AuthService.swift
//  FestiWind
//
//  Created by Apprenant 77 on 28/10/2026.
//

import Foundation
 

 
struct AuthService {
    private let webService = WebService()
 
    func login(email: String, password: String) async throws -> String {
        let response: AuthResponseDTO = try await webService.request(
            "users/login",
            method: .post,
            body: LoginRequestDTO(email: email, password: password)
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
            body: RegisterRequestDTO(name: name, email: email, password: password)
        )
    }
}

