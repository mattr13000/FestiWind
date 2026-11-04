//
//  ContentView.swift
//  FestiWind
//
//  Created by Apprenant 77 on 14/09/2026.
//

import SwiftUI

struct TabBarView: View {
    @State private var festivalManager = FestivalManager()
    var body: some View {
        TabView {
            Tab(.navTitleSchedule, systemImage: "book") {
                ScheduleView(manager: festivalManager)
            }

            Tab(.navTitleBookings, systemImage: "calendar") {
                BookingsView(manager: festivalManager)
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
