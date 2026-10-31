//
//  BookingsCard.swift
//  FestiWind
//
//  Created by Apprenant 77 on 15/09/2026.
//

import SwiftUI

struct BookingsCard: View {
    var title: String
    var startTime: Date
    var endTime: Date
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text(title)
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                
                Spacer()
                Text(.bookingsStatusConfirmed)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
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
            .padding(.bottom, 20)
            .foregroundColor(.black)
            GlassButtonView(
                buttonText: .commonCancel,
                frameMaxWidth: .infinity,
                frameMaxHeight: 1,
                opacity: 0.3,
                textColor: .textPrimary,
                backgroundColor: .buttonColorCancel
            ){}
        }
        .padding(30)
        .background(
            CardTemplateView()
        )
    }
}


#Preview {
    BookingsCard(title: "placeholder", startTime: Date(), endTime: Date())
}
