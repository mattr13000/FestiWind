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
        let query: [String: Any] = [
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
            throw KeychainError.unexpectedData
        }
        
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: KeychainList.authToken.rawValue,
        ]
        
        // Commenting this because it's still blurry after making it work
        // SecItemUpdate needs query without data to find the item
        var queryWithToken = query
        queryWithToken[kSecValueData as String] = tokenData
        
        let status = SecItemAdd(queryWithToken as CFDictionary, nil)
        
        switch status {
            // Item didn't exist we created it
            case errSecSuccess:
                return
            
            // Item already exists we replace the data
            case errSecDuplicateItem:
                let attributes: [String : Any] = [kSecValueData as String: tokenData]
                let updateStatus = SecItemUpdate(query as CFDictionary, attributes as CFDictionary)
                guard updateStatus == errSecSuccess else {
                    throw KeychainError.unhandledError(status: updateStatus)
                }
            default:
                throw KeychainError.unhandledError(status: status)
        }
    }
    
    static func deleteToken() async throws {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: KeychainList.authToken.rawValue
        ]
        
        let status = SecItemDelete(query as CFDictionary)
        
        guard status == errSecSuccess || status == errSecItemNotFound else {
            throw KeychainError.unhandledError(status: status)
        }
    }
}
