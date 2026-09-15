//
//  TextFieldView.swift
//  FestiWind
//
//  Created by Apprenant 77 on 15/09/2026.
//

import SwiftUI

struct TextFieldView: View {
    @Binding var textFieldContent: String
    var frameMaxWidth: CGFloat
    var body: some View {
        TextField("Email", text: $textFieldContent)
            .padding()
            .background(.white)
            .cornerRadius(5)
            .frame(maxWidth: frameMaxWidth)
            .shadow(color: .textSecondary, radius: 1, x: 0, y: 1)
    }
}

#Preview {
    TextFieldView(textFieldContent: .constant("Placeholder"), frameMaxWidth: 330)
}
