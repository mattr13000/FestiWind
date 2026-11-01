//
//  ScheduleView.swift
//  FestiWind
//
//  Created by Apprenant 77 on 15/09/2026.
//

import SwiftUI

struct ScheduleView: View {
    @State private var scheduleVM: ScheduleViewModel
    
    init(store: FestivalStore) {
        _scheduleVM = State(initialValue: ScheduleViewModel(store: store))
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                BackgroundView()
                ScrollView {
                    VStack {
                        ForEach (scheduleVM.workshops) { workshop in
                            ScheduleCard(
                                title: workshop.name,
                                startTime: workshop.startTime,
                                endTime: workshop.endTime,
                                remainingSlots: workshop.remainingSlots,
                                bookingStatus: scheduleVM.getBookingState(workshop: workshop))
                            {
                                Task {
                                    await scheduleVM.postReservation( workshopID: workshop.id)
                                }
                            }
                        }
                    }
                }
                .navigationTitle(.navTitleSchedule)
            }
        }
        .task {
            await scheduleVM.loadWorkshops()
            await scheduleVM.loadBookings()
        }
    }
}

#Preview {
    ScheduleView(store: FestivalStore())
}
