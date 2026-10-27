//
//  FestiWindApp.swift
//  FestiWind
//
//  Created by Apprenant 77 on 14/09/2026.
//

import SwiftUI

@main
struct FestiWindApp: App {
    @State private var authManager = AuthManager()
    @State private var loginVM = LoginViewModel()
    var body: some Scene {
        WindowGroup {
            RootView()
                .environment(authManager)
                .environment(loginVM)
        }
    }
}
