//
//  ContentView.swift
//  FestiWind
//
//  Created by Apprenant 77 on 14/09/2026.
//

import SwiftUI

struct TabBarView: View {
    @State private var festivalStore = FestivalStore()
    var body: some View {
        TabView {
            Tab(.navTitleSchedule, systemImage: "book") {
                ScheduleView(store: festivalStore)
            }
            
            Tab(.navTitleBookings, systemImage: "calendar") {
                BookingsView(store: festivalStore)
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
