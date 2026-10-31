//
//  BookingsView.swift
//  FestiWind
//
//  Created by Apprenant 77 on 15/09/2026.
//

import SwiftUI

struct BookingsView: View {
    @State private var bookingsVM = BookingsViewModel()
    var body: some View {
        NavigationStack {
            ZStack {
              BackgroundView()
                ScrollView {
                    VStack(alignment: .center) {
                        if (bookingsVM.bookingsList.count == 0) {
                            Text("Pas encore de réservations")
                        }
                        else {
                            ForEach (bookingsVM.bookingsList) { booking in
                                BookingsCard(title: booking.workshopName,
                                             startTime: booking.startTime,
                                             endTime: booking.endTime
                                )
                            }
                        }
                    }
                    .navigationTitle(.navTitleBookings)
                }                
            }
        }
        .task {
            await bookingsVM.getUserReservationsList()
        }
    }
}

#Preview {
    BookingsView()
}
