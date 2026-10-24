//
//  KeychainManager.swift
//  FestiWind
//
//  Created by Apprenant 77 on 24/10/2026.
//

import SwiftUI

enum KeychainError: Error {
    case noPassword
    case unexpectedPasswordData
    case saveFailed
    case unhandledError(status: OSStatus)
}

enum KeychainList: String {
    case authToken = "com.festiwind.authToken"
}

struct KeychainManager {
    static func saveToken(token: String) async throws {
        guard let tokenData = token.data(using: .utf8) else {
            throw KeychainError.unexpectedPasswordData
        }
        
        var query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: KeychainList.authToken.rawValue,
            kSecValueData as String: tokenData
        ]
        
        guard SecItemAdd(query as CFDictionary, nil) == errSecSuccess else {
            throw KeychainError.unhandledError(status: OSStatus())
        }
    }
}
