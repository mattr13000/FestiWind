//
//  BookingsView.swift
//  FestiWind
//
//  Created by Apprenant 77 on 15/09/2026.
//

import SwiftUI

struct BookingsView: View {
    @State private var bookingsVM: BookingsViewModel
    init(store: FestivalStore) {
        _bookingsVM = State(initialValue: BookingsViewModel(store: store))
    }
    var body: some View {
        NavigationStack {
            ZStack {
              BackgroundView()
                if (bookingsVM.bookingsList.count == 0) {
                    ContentUnavailableView(.bookingsNoBookingsPrompt, systemImage: "calendar.badge.exclamationmark")
                }
                else {
                ScrollView {
                    VStack(alignment: .center) {
                            ForEach (bookingsVM.bookingsList) { booking in
                                BookingsCard(title: booking.workshopName,
                                             startTime: booking.startTime,
                                             endTime: booking.endTime
                                ){
                                    Task {
                                        await bookingsVM.cancelReservation(reservationID: booking.id)
                                        await bookingsVM.bookingsList
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
            await bookingsVM.bookingsList
        }
    }
}

#Preview {
    BookingsView(store: FestivalStore())
}
