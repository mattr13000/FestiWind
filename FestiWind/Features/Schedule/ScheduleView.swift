//
//  ScheduleView.swift
//  FestiWind
//
//  Created by Apprenant 77 on 15/09/2026.
//

import SwiftUI

struct ScheduleView: View {
    @State private var scheduleVM = ScheduleViewModel()
    var body: some View {
        NavigationStack {
            ZStack {
                BackgroundView()
                ScrollView {
                    VStack {
                        ForEach (scheduleVM.workshopList) { workshop in
                            ScheduleCard(title: workshop.name, remainingSpots: (workshop.capacityMax - workshop.totalSubscribers))
                        }
                    }
                }
                .navigationTitle(.navTitleSchedule)
            }
        }
        .task {
            await scheduleVM.getWorkshopList()
            print(scheduleVM.workshopList)
        }
    }
}

#Preview {
    ScheduleView()
}
