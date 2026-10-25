//
//  KeychainManager.swift
//  FestiWind
//
//  Created by Apprenant 77 on 24/10/2026.
//

import SwiftUI

enum KeychainError: Error {
    case noPassword
    case unexpectedData
    case unexpectedPasswordData
    case saveFailed
    case unhandledError(status: OSStatus)
}

enum KeychainList: String {
    case authToken = "com.festiwind.authToken"
}

struct KeychainManager {
    static func getToken() async throws -> String? {
        var query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: KeychainList.authToken.rawValue,
            kSecReturnData as String: true,
            kSecMatchLimit as String: kSecMatchLimitOne
        ]
        
        var itemResult: AnyObject?
        
        let status = SecItemCopyMatching(query as CFDictionary, &itemResult)
        guard status == errSecSuccess else {
            if status == errSecItemNotFound {
                return nil
            }
            throw KeychainError.unhandledError(status: status)
        }
        
        guard let data = itemResult as? Data,
              let token = String(data: data, encoding: .utf8) else {
            throw KeychainError.unexpectedData
        }
        
        return token
    }
    
    static func saveToken(token: String) async throws {
        guard let tokenData = token.data(using: .utf8) else {
            throw KeychainError.unexpectedPasswordData
        }
        
        var query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: KeychainList.authToken.rawValue,
            kSecValueData as String: tokenData
        ]
        
        let status = SecItemAdd(query as CFDictionary, nil)
        
        guard status == errSecSuccess else {
            throw KeychainError.unhandledError(status: status)
        }
    }
}
