//
//  BookingsView.swift
//  FestiWind
//
//  Created by Apprenant 77 on 15/09/2026.
//

import SwiftUI

struct BookingsView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color.backgroundBlue
                    .ignoresSafeArea()
                ScrollView {
                    VStack {
                        BookingsCard()
                        BookingsCard()
                        BookingsCard()
                        BookingsCard()
                        BookingsCard()
                        BookingsCard()
                        BookingsCard()
                        BookingsCard()
                    }
                    .navigationTitle(.navTitleBookings)
                }
                
            }
        }
    }
}

#Preview {
    BookingsView()
}
