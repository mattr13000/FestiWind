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
                            TextFieldView(textFieldContent: $name, placeholderText: "Name", frameMaxWidth: 150, isSecure: false)
                            Spacer()
                            TextFieldView(textFieldContent: $name, placeholderText: "Surname", frameMaxWidth: 150, isSecure: false)
                            
                        }
                        .frame(maxWidth: 363)
                        TextFieldView(textFieldContent: $name, placeholderText: "Email", frameMaxWidth: 330, isSecure: false)
                        TextFieldView(textFieldContent: $name, placeholderText: "Password", frameMaxWidth: 330, isSecure: true)
                        TextFieldView(textFieldContent: $name, placeholderText: "Confirm Password", frameMaxWidth: 330, isSecure: true)
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
}

#Preview {
    RegisterView()
}
