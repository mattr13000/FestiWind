//
//  SwiftUIView.swift
//  FestiWind
//
//  Created by Apprenant 77 on 02/11/2026.
//

import SwiftUI

struct IconBounceView: View {
    @State private var counter = 0

    var body: some View {
        VStack {
            VStack {
                Image(systemName: "bolt.slash.fill")
                Image(systemName: "folder.fill.badge.person.crop")
            }
            .symbolEffect(.bounce, value: counter)

            Button("Trigger Bounce") {
                counter += 1 // Changing this variable triggers the effect
            }
        }
    }
}

#Preview {
    IconBounceView()
}
