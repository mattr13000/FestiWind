//
//  RegisterView.swift
//  FestiWind
//
//  Created by Apprenant 77 on 15/09/2026.
//

import SwiftUI

struct RegisterView: View {
    @State private var name: String = ""
    var body: some View {
        NavigationStack {
        ZStack {
            BackgroundView()
                VStack {
                    Spacer()
                    VStack(spacing: 20) {
                        HStack {
                            TextFieldView(textFieldContent: $name, placeholderText: .commonNamePlaceholder, frameMaxWidth: 150, isSecure: false)
                            Spacer()
                            TextFieldView(textFieldContent: $name, placeholderText: .commonSurnamePlaceholder, frameMaxWidth: 150, isSecure: false)
                            
                        }
                        .frame(maxWidth: 363)
                        TextFieldView(textFieldContent: $name, placeholderText: .commonEmailPlaceholder, frameMaxWidth: 330, isSecure: false)
                        TextFieldView(textFieldContent: $name, placeholderText: .commonPasswordPlaceholder, frameMaxWidth: 330, isSecure: true)
                        TextFieldView(textFieldContent: $name, placeholderText: .commonPwConfirmPlaceholder, frameMaxWidth: 330, isSecure: true)
                    }
                    Spacer()
                    GlassButtonView(buttonText: .authRegister, frameMaxWidth: 280, opacity: 0.3, textColor: .textPrimary, backgroundColor: .buttonColorActive)
                    HStack {
                        Text(.authAlreadyRegisteredPrompt)
                        TextButtonView(buttonText: .authLogin)
                    }
                    Spacer()
                }
                .navigationTitle(.authRegister)
                
            }
            
        }
        
    }
}

#Preview {
    RegisterView()
}
