//
//  CardTemplateView.swift
//  FestiWind
//
//  Created by Apprenant 77 on 15/09/2026.
//

import SwiftUI

struct CardTemplateView: View {
    var body: some View {
        Rectangle()
            .frame(maxHeight: .infinity)
            .cornerRadius(8)
            .padding()
            .foregroundStyle(.white)
            .shadow(color: .textSecondary, radius: 1, x: 0, y: 1)
    }
}

#Preview {
    CardTemplateView()
}
