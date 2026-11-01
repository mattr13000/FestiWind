//
//  ContentView.swift
//  FestiWind
//
//  Created by Apprenant 77 on 14/09/2026.
//

import SwiftUI

struct TabBarView: View {
    @State private var reservationManager = ReservationManager()
    var body: some View {
        TabView {
            Tab(.navTitleSchedule, systemImage: "book") {
                ScheduleView()
                    .environment(reservationManager)
            }
            
            Tab(.navTitleBookings, systemImage: "calendar") {
                BookingsView()
                    .environment(reservationManager)
            }
            Tab(.navTitleProfile, systemImage: "person.fill") {
                ProfileView()
            }
        }

    }
}

#Preview {
    TabBarView()
}
