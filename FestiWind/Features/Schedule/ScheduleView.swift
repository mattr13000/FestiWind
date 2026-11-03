//
//  ScheduleView.swift
//  FestiWind
//
//  Created by Apprenant 77 on 15/09/2026.
//

import SwiftUI

struct ScheduleView: View {
    @State private var scheduleVM: ScheduleViewModel
    
    init(manager: FestivalManager) {
        _scheduleVM = State(initialValue: ScheduleViewModel(manager: manager))
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                BackgroundView()
                ScrollView {
                    VStack {
                        ForEach (scheduleVM.workshops) { workshop in
                            NavigationLink(destination: DetailScheduleView(
                                workshop: workshop,
                                action: {
                                    Task {
                                        await scheduleVM.postReservation(
                                            workshopID: workshop.id
                                        )
                                    }
                                }
                                )
                            ) {
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
                }
                .navigationTitle(.navTitleSchedule)
            }
        }
        .task {
            await scheduleVM.loadAll()
        }
    }
}

#Preview {
    ScheduleView(manager: FestivalManager())
}
