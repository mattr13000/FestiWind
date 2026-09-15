//
//  TextFieldView.swift
//  FestiWind
//
//  Created by Apprenant 77 on 15/09/2026.
//

import SwiftUI

struct TextFieldView: View {
    @Binding var textFieldContent: String
    var placeholderText: String
    var frameMaxWidth: CGFloat
    var isSecure: Bool
    var body: some View {
        if isSecure {
            SecureField(placeholderText, text: $textFieldContent)
                .textFieldModifier(frameMaxWidth: frameMaxWidth)
        } else {
            TextField(placeholderText, text: $textFieldContent)
                .textFieldModifier(frameMaxWidth: frameMaxWidth)
        }
    }
}

#Preview {
    TextFieldView(textFieldContent: .constant(""), placeholderText: "Placeholder", frameMaxWidth: 330, isSecure: false)
}
