//
//  AuthState.swift
//  FestiWind
//
//  Created by Apprenant 77 on 27/10/2026.
//

import Foundation

enum AuthState {
    case unknown
    case checking
    case unauthenticated
    case authenticated

    var statusMessage: LocalizedStringResource {
        switch self {
        case .unknown:
            .authStatusUnknown
        case .checking:
            .authStatusChecking
        case .unauthenticated:
            .authStatusUnauthenticated
        case .authenticated:
            .authStatusAuthenticated
        }
    }
}
