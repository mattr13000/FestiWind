//
//  CustomTextFieldModifier.swift
//  FestiWind
//
//  Created by Apprenant 77 on 15/09/2026.
//

import SwiftUI

extension View {
    func textFieldModifier(frameMaxWidth: CGFloat) -> some View {
        self
            .frame(maxWidth: frameMaxWidth)
            .padding()
            .background(.white)
            .cornerRadius(5)
            .shadow(color: .textSecondary, radius: 1, x: 0, y: 1)
    }
}
