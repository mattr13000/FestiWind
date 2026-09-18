//
//  ScheduleCard.swift
//  FestiWind
//
//  Created by Apprenant 77 on 15/09/2026.
//

import SwiftUI

struct ScheduleCard: View {
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Kite surf")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.black)
            
            HStack() {
                Image(systemName: "clock")
                    .font(.subheadline)
                Text("11 pm to 12 pm")
                    .font(.subheadline)
            }
            .foregroundColor(.black)
            
            HStack {
                Spacer()
                
                Text(.scheduleRemainingSpots)
                
                // DONT FORGET TO GRAY BUTTON IF THIS = 0 LATER !!
                
                Text("0")
                    
            }
            .font(.subheadline)
                .foregroundColor(.gray)
            GlassButtonView(
                buttonText: .scheduleBookPrompt,
                frameMaxWidth: .infinity,
                frameMaxHeight: 1,
                opacity: 0.3,
                textColor: .textPrimary,
                backgroundColor: .buttonColorActive
            )
        }
        .padding(30)
        .background(
            CardTemplateView()
        )
    }
}

#Preview {
    ScheduleCard()
}
