//
//  APIClient.swift
//  FestiWind
//
//  Created by Apprenant 87 on 23/10/2026.
//


import Foundation

struct LoginRequest: Encodable {
    let email: String
    let password: String
}

struct AuthResponse: Decodable {
    let token: String
}

struct APIClient {
    private let baseURL = URL(string: "http://127.0.0.1:8080")!

    func login(email: String, password: String) async throws -> String {
        let url = baseURL.appendingPathComponent("users/login")

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue(
            "application/json",
            forHTTPHeaderField: "Content-Type"
        )

        request.httpBody = try JSONEncoder().encode(
            LoginRequest(email: email, password: password)
        )

        let (data, response) = try await URLSession.shared.data(for: request)

        guard let httpResponse = response as? HTTPURLResponse else {
            throw URLError(.badServerResponse)
        }

        guard (200..<300).contains(httpResponse.statusCode) else {
            throw NSError(
                domain: "APIClient",
                code: httpResponse.statusCode,
                userInfo: [
                    NSLocalizedDescriptionKey:
                        "Erreur HTTP \(httpResponse.statusCode)"
                ]
            )
        }

        let authResponse = try JSONDecoder().decode(
            AuthResponse.self,
            from: data
        )

        return authResponse.token
    }
}
