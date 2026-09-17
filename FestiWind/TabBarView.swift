//
//  ContentView.swift
//  FestiWind
//
//  Created by Apprenant 77 on 14/09/2026.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Tab(.navTitleSchedule, systemImage: "book") {
                ScheduleView()
            }
            
            Tab(.navTitleBookings, systemImage: "calendar") {
                BookingsView()
            }
            Tab(.navTitleProfile, systemImage: "person.fill") {
                ProfileView()
            }
        }

    }
}

#Preview {
    ContentView()
}
