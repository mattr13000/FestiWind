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
            Tab("Home", systemImage: "house.fill") {
                LoginView()
            }
            
            Tab(.navTitleSchedule, systemImage: "book") {
                ScheduleView()
            }
            
            Tab(.navtitleBookings, systemImage: "calendar") {
                BookingsView()
            }
        }

    }
}

#Preview {
    ContentView()
}
