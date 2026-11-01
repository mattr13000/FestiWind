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
    var isDisabled: Bool
    var action: () -> Void
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.black)
            
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
                
                // DONT FORGET TO GRAY BUTTON IF THIS = 0 LATER !!
                
                Text(String(remainingSlots))
                    
            }
            .font(.subheadline)
                .foregroundColor(.gray)
            GlassButtonView(
                buttonText: isDisabled ? .scheduleButtonDisabledBooked : .scheduleButtonEnabled,
                frameMaxWidth: .infinity,
                frameMaxHeight: 1,
                opacity: 0.3,
                textColor: .textPrimary,
                backgroundColor: isDisabled ? .buttonColorInactive : .buttonColorActive,
                action: action
            )
        }
        .disabled(BookingStatus.bookingAvailable.buttonState)
        .padding(30)
        .background(
            CardTemplateView()
        )
    }
}

#Preview {
    ScheduleCard(title: "Placeholder", startTime: Date(), endTime: Date(), remainingSlots: 6, isDisabled: true){}
}
