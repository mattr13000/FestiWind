//
//  BookingsView.swift
//  FestiWind
//
//  Created by Apprenant 77 on 15/09/2026.
//

import SwiftUI

struct BookingsView: View {
    @Environment(ReservationManager.self) var reservationManager
    @State private var bookingsVM = BookingsViewModel()
    var body: some View {
        NavigationStack {
            ZStack {
              BackgroundView()
                if (reservationManager.bookingsList.count == 0) {
                    ContentUnavailableView(.bookingsNoBookingsPrompt, systemImage: "calendar.badge.exclamationmark")
                }
                else {
                ScrollView {
                    VStack(alignment: .center) {
                            ForEach (reservationManager.bookingsList) { booking in
                                BookingsCard(title: booking.workshopName,
                                             startTime: booking.startTime,
                                             endTime: booking.endTime
                                ){
                                    Task {
                                        await bookingsVM.cancelReservation(reservationID: booking.id)
                                        await reservationManager.getUserReservationsList()
                                    }
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle(.navTitleBookings)
        }
        .task {
            await reservationManager.getUserReservationsList()
        }
    }
}

#Preview {
    BookingsView()
        .environment(ReservationManager())
}
