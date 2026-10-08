//
//  DetailScheduleView.swift
//  FestiWind
//
//  Created by Apprenant 87 on 08/10/2026.
//

import SwiftUI

struct DetailScheduleView: View {
    var body: some View {
        NavigationStack{
            ZStack{
                BackgroundView()
                VStack{
                    BackgroundImageView()
                        .frame(height: 300)
                    VStack(alignment: .leading, spacing: 12) {
                        HStack {
                            Text("Kite surf")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                            Spacer()
                            Text(.bookingsStatusConfirmed)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        HStack() {
                            Image(systemName: "clock")
                                .font(.subheadline)
                            Text("11 pm to 12 pm")
                                .font(.subheadline)
                        }
                        Text(.detailDescriptionPlaceholder)
                        //                    .padding(.bottom, 20)
                            .foregroundColor(.black)
                        Text("Le kitesurf, ou planche arétractée a était créer dans les années 2000.")
                            .padding(.bottom, 20)
                            .foregroundColor(.black)
                        GlassButtonView(
                            buttonText: .commonBookPrompt,
                            frameMaxWidth: .infinity,
                            frameMaxHeight: 1,
                            opacity: 0.3,
                            textColor: .textPrimary,
                            backgroundColor: .buttonColorCancel
                        )
                    }
                    .padding(36)
                    .background(
                        CardTemplateView()
                            .padding(.horizontal, 12)
                    )
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    DetailScheduleView()
}
