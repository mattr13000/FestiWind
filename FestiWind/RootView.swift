//
//  RootView.swift
//  FestiWind
//
//  Created by Apprenant 77 on 27/10/2026.
//

import SwiftUI

struct RootView: View {

    @Environment(AuthManager.self) private var authManager
    var body: some View {
        ZStack {
            switch authManager.authState {
            case .unknown, .checking:
                LoadingView(message: authManager.authState.statusMessage)
            case .unauthenticated:
                LoginView()
            case .authenticated:
                TabBarView()
            }
        }
        .transition(.opacity)
        .animation(.easeInOut(duration: 0.4), value: authManager.authState)
        .task {
            await authManager.checkStatus()
        }
    }
}

#Preview {
    RootView()
        .environment(AuthManager())
}
