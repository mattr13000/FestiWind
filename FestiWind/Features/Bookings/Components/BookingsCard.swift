//
//  BookingsCard.swift
//  FestiWind
//
//  Created by Apprenant 77 on 15/09/2026.
//

import SwiftUI

struct BookingsCard: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text("Kite surf")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                Spacer()
                Text("Confirmed")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            HStack() {
                Image(systemName: "clock")
                    .font(.subheadline)
                Text("11 pm to 12 pm")
                    .font(.subheadline)
            }
            .padding(.bottom, 20)
            .foregroundColor(.black)
            GlassButtonView(
                buttonText: "Cancel",
                frameMaxWidth: .infinity,
                frameMaxHeight: 1,
                opacity: 0.3,
                textColor: .textPrimary,
                backgroundColor: .buttonColorCancel
            )
        }
        .padding(30)
        .background(
            CardTemplateView()
        )
    }
}


#Preview {
    BookingsCard()
}
