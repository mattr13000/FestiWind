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
            VStack {
                Spacer()
                VStack(spacing: 20) {
                    HStack {
                        TextFieldView(textFieldContent: $name, frameMaxWidth: 150)
                        Spacer()
                        TextFieldView(textFieldContent: $name, frameMaxWidth: 150)
                    }
                    .frame(maxWidth: 330)
                    TextFieldView(textFieldContent: $name, frameMaxWidth: 330)
                    TextFieldView(textFieldContent: $name, frameMaxWidth: 330)
                    TextFieldView(textFieldContent: $name, frameMaxWidth: 330)
                }
                Spacer()
                GlassButtonView(buttonText: "Register", frameMaxWidth: 280, opacity: 0.3, textColor: .textPrimary, backgroundColor: .buttonColorActive)
                HStack {
                    Text("Already have an account ?")
                    TextButtonView(buttonText: "Log in")
                }
                Spacer()
            }
            .navigationTitle("Register")
        }
    }
}

#Preview {
    RegisterView()
}
