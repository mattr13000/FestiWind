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
            Text(authManager.authState.statusMessage)
        }
    }
}

#Preview {
    RootView()
        .environment(AuthManager())
}
