//
//  SwiftUIView.swift
//  FestiWind
//
//  Created by Apprenant 77 on 17/09/2026.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color.backgroundBlue
                    .ignoresSafeArea()
                VStack {
                    Text(.commonFeaturePlaceholder)
                        .font(.title2)
                }
                .navigationTitle(.navTitleProfile)
            }
            
        }
    }
}

#Preview {
    ProfileView()
}
