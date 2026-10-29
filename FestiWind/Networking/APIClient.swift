//
//  APIClient.swift
//  FestiWind
//
//  Created by Apprenant 87 on 23/10/2026.
//


import Foundation

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
}


struct APIClient {
    private let baseURL = URL(string: "http://127.0.0.1:8080")!

    func request<T: Decodable>(
        _ path: String,
        method: HTTPMethod = HTTPMethod.get,
        body: (any Encodable)? = nil
    ) async throws -> T {
        let url = baseURL.appendingPathComponent(path)

        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.setValue(
            "application/json",
            forHTTPHeaderField: "Content-Type"
        )

        if let body {
            request.httpBody = try JSONEncoder().encode(body)
        }

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

        return try JSONDecoder().decode(T.self, from: data)
    }
}
