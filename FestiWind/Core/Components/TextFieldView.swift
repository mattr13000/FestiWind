//
//  TextFieldView.swift
//  FestiWind
//
//  Created by Apprenant 77 on 15/09/2026.
//

import SwiftUI

struct TextFieldView: View {
    @Binding var textFieldContent: String
    var placeholderText: LocalizedStringResource
    var errorText: LocalizedStringResource?
    var frameMaxWidth: CGFloat
    var isSecure: Bool
    var body: some View {
        VStack(alignment: .leading) {
            Text(errorText ?? .placeholder)
                .font(.subheadline)
                .foregroundStyle(.red)
                .opacity(errorText == nil ? 0 : 1)
                .accessibilityHidden(errorText == nil)
            if isSecure {
                SecureField(placeholderText, text: $textFieldContent)
                    .textFieldModifier(frameMaxWidth: frameMaxWidth)
            } else {
                TextField(placeholderText, text: $textFieldContent)
                    .textFieldModifier(frameMaxWidth: frameMaxWidth)
            }
        }
    }
}

#Preview {
    TextFieldView(textFieldContent: .constant(""), placeholderText: .placeholder, frameMaxWidth: 330, isSecure: false)
}
