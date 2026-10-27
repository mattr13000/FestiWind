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
            HomeBackgroundImageView()
            VStack {
                Text(.appTitle)
                    .font(.custom("Shalimar-Regular", size: 80))
                Text(authManager.authState.statusMessage)
                    .font(.title)
            }
        }
        .task {
            await authManager.checkStatus()
        }
    }
}

#Preview {
    RootView()
        .environment(AuthManager())
}
