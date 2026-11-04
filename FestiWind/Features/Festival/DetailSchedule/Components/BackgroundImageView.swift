//
//  BackgroundImageView.swift
//  FestiWind
//
//  Created by Apprenant 87 on 08/10/2026.
//

import SwiftUI

struct BackgroundImageView: View {
    var body: some View {
        Image("HomeBackgroundImage")
            .resizable()
            .scaledToFill()
            .scaleEffect(1)
            .ignoresSafeArea()
    }
}

#Preview {
    BackgroundImageView()
}
