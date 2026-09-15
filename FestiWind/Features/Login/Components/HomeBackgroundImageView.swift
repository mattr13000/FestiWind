//
//  HomeBackgroundImageView.swift
//  FestiWind
//
//  Created by Apprenant 77 on 15/09/2026.
//

import SwiftUI

struct HomeBackgroundImageView: View {
    var body: some View {
        Image("HomeBackgroundImage")
            .resizable()
            .scaledToFill()
            .scaleEffect(1)
            .ignoresSafeArea()
        Color.white
            .opacity(0.55)
            .ignoresSafeArea()
    }
}

#Preview {
    HomeBackgroundImageView()
}
