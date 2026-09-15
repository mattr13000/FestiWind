//
//  TextButtonView.swift
//  FestiWind
//
//  Created by Apprenant 77 on 15/09/2026.
//

import SwiftUI

struct TextButtonView: View {
    var buttonText: String
    var body: some View {
        Button {}
        label: {
            Text(buttonText)
                .font(.subheadline)
                .underline()
                .foregroundStyle(.textLink)
        }
    }
}

#Preview {
    TextButtonView(buttonText: "Placeholder")
}
