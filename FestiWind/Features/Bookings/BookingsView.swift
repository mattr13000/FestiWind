//
//  BookingsView.swift
//  FestiWind
//
//  Created by Apprenant 77 on 15/09/2026.
//

import SwiftUI

struct BookingsView: View {
    @State private var bookingsVM: BookingsViewModel
    init(manager: FestivalManager) {
        _bookingsVM = State(initialValue: BookingsViewModel(manager: manager))
    }
    var body: some View {
        NavigationStack {
            ZStack {
              BackgroundView()
                if (bookingsVM.userBookings.count == 0) {
                    ContentUnavailableView(.bookingsNoBookingsPrompt, systemImage: "calendar.badge.exclamationmark")
                }
                else {
                ScrollView {
                    VStack(alignment: .center) {
                            ForEach (bookingsVM.userBookings) { booking in
                                BookingsCard(title: booking.workshopName,
                                             startTime: booking.startTime,
                                             endTime: booking.endTime
                                ){
                                    Task {
                                        await bookingsVM.cancelReservation(reservationID: booking.id)
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
            await bookingsVM.loadBookings()
        }
    }
}

#Preview {
    BookingsView(manager: FestivalManager())
}
