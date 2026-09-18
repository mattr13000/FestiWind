//
//  GlassButtonView.swift
//  FestiWind
//
//  Created by Apprenant 77 on 15/09/2026.
//

import SwiftUI

struct GlassButtonView: View {
    
    var buttonText: LocalizedStringResource
    var frameMaxWidth: CGFloat
    var frameMaxHeight: CGFloat?
    var opacity: CGFloat
    var textColor: Color
    var backgroundColor: Color
    
    var body: some View {
        Button {}
        label: {
            Text(buttonText)
                .font(.headline)
                .foregroundStyle(textColor)
                .frame(maxWidth: frameMaxWidth, maxHeight: frameMaxHeight)
                .padding()
                .glassEffect(.regular.tint(backgroundColor.opacity(opacity)))
        }
    }
}

#Preview {
    GlassButtonView(buttonText: .placeholder, frameMaxWidth: 280, opacity: 0.3, textColor: .textPrimary, backgroundColor: .buttonColorActive)
}
