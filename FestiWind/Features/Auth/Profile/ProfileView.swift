//
//  SwiftUIView.swift
//  FestiWind
//
//  Created by Apprenant 77 on 17/09/2026.
//

import SwiftUI

struct ProfileView: View {
    @Environment(AuthManager.self) var authManager
    @State var isLoggingOut: Bool = false
    var body: some View {
        NavigationStack {
            ZStack {
                Color.backgroundBlue
                    .ignoresSafeArea()
                VStack {
                    Text(.commonFeaturePlaceholder)
                        .font(.title2)
                    Text(authManager.errorMessage ?? "")
                    GlassButtonView(
                        buttonText: "Log out",
                        frameMaxWidth: 280,
                        opacity: 0.3,
                        textColor: .textPrimary,
                        backgroundColor: .red
                    ) {
                        Task {
                           isLoggingOut = true
                        }
                    }
                    .alert(
                        .logoutAlertPrompt,
                        isPresented: $isLoggingOut) {
                        Button(
                            .logoutCancel,
                            role: .cancel
                        ) {}
                        Button(
                            .logoutConfirm,
                            role: .destructive
                        ) {
                            Task {
                                await authManager.logout()
                            }
                        }
                        }
                }
                .navigationTitle(.navTitleProfile)
            }
            
        }
    }
}

#Preview {
    ProfileView()
        .environment(AuthManager())
}
