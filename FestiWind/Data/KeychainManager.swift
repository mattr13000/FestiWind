//
//  KeychainManager.swift
//  FestiWind
//
//  Created by Apprenant 77 on 24/10/2026.
//

import SwiftUI

struct Credentials {
    var username: String
    var password: String
}

enum KeychainError: Error {
    case noPassword
    case unexpectedPasswordData
    case unhandledError(status: OSStatus)
}

struct KeychainManager {
//    static let server = "www.example.com"
//    let credentials = Credentials(username: <#T##String#>, password: <#T##String#>)
//    let account = credentials.username
//    let password = credentials.password.data(using: String.Encoding.utf8)!
//    var query: [String: Any] = [kSecClass as String: kSecClassInternetPassword,
//                                kSecAttrAccount as String: account,
//                                kSecAttrServer as String: server,
//                                kSecValueData as String: password]
//    let status = SecItemAdd(query as CFDictionary, nil)
//    guard status == errSecSuccess else { throw KeychainError.unhandledError(status: status) }

}
