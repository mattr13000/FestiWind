//
//  ScheduleView.swift
//  FestiWind
//
//  Created by Apprenant 77 on 15/09/2026.
//

import SwiftUI

struct ScheduleView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color.backgroundBlue
                    .ignoresSafeArea()
                ScrollView {
                    VStack {
                        ScheduleCard()
                        ScheduleCard()
                        ScheduleCard()
                        ScheduleCard()
                        ScheduleCard()
                        ScheduleCard()
                    }
                }
                .navigationTitle("Schedule")
            }
        }
    }
}

#Preview {
    ScheduleView()
}
