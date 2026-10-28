//
//  LoadingView.swift
//  FestiWind
//
//  Created by Apprenant 77 on 27/10/2026.
//

import SwiftUI

struct LoadingView: View {
    let message: LocalizedStringResource
    var body: some View {
        ZStack {
            HomeBackgroundImageView()
            VStack {
                Text(.appTitle)
                    .font(.custom("Shalimar-Regular", size: 80))
                Text(message)
                    .font(.title)
            }
        }
    }
}

#Preview {
    LoadingView(message: .authStatusUnknown)
}
