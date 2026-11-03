//
//  ScheduleCard.swift
//  FestiWind
//
//  Created by Apprenant 77 on 15/09/2026.
//

import SwiftUI

struct ScheduleCard: View {
    var title: String
    var startTime: Date
    var endTime: Date
    var remainingSlots: Int
    var bookingStatus: BookingStatus
    var action: () -> Void
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .font(.title2)
                .fontWeight(.bold)
                .foregroundStyle(.black)
            
            HStack {
                Image(systemName: "calendar")
                Text("\(startTime.formatted(.dateTime.weekday(.wide).day().month(.wide)))")
            }
            .font(.subheadline)
            
            HStack {
                Image(systemName: "clock")
                    .font(.subheadline)
                Text("\(startTime.formatted(.dateTime.hour().minute())) - \(endTime.formatted(.dateTime.hour().minute()))")
            }
            .font(.subheadline)
            
            HStack {
                Spacer()
                
                Text(.scheduleRemainingSpots)

                Text(String(remainingSlots))
                    .contentTransition(.numericText())
                    
            }
            .font(.subheadline)
                .foregroundStyle(.gray)
            GlassButtonView(
                buttonText: bookingStatus.resource,
                frameMaxWidth: .infinity,
                frameMaxHeight: 1,
                opacity: 0.3,
                textColor: .textPrimary,
                backgroundColor: bookingStatus.buttonState ? .buttonColorInactive : .buttonColorActive,
                isLoading: bookingStatus == .pendingRequest,
                action: action
            )
            .disabled(bookingStatus.buttonState)
        }
        .padding(30)
        .background(
            CardTemplateView()
        )
    }
}

#Preview {
    ScheduleCard(title: "Placeholder", startTime: Date(), endTime: Date(), remainingSlots: 6, bookingStatus: .alreadyBooked){}
}
