//
//  DetailScheduleView.swift
//  FestiWind
//
//  Created by Apprenant 87 on 08/10/2026.
//

import SwiftUI

struct WorkshopDetailView: View {
    
    @State private var workshopDetailVM: WorkshopDetailViewModel
    var workshopID: UUID
    init(manager: FestivalManager) {
        _workshopDetailVM = State(initialValue: WorkshopDetailViewModel(manager: manager))
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                BackgroundView()
                VStack {
                    BackgroundImageView()
                        .frame(height: 300)
                    VStack(alignment: .leading, spacing: 12) {
                        HStack {
                            Text(workshop.name)
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
                            Text("\(workshop.startTime.formatted(.dateTime.weekday(.wide).day().month(.wide)))")
                        }
                        .font(.subheadline)
                        
                        HStack {
                            Image(systemName: "clock")
                                .font(.subheadline)
                            Text("\(workshop.startTime.formatted(.dateTime.hour().minute())) - \(workshop.endTime.formatted(.dateTime.hour().minute()))")
                        }
                        Text(.detailDescriptionPlaceholder)
                            .foregroundColor(.black)
                        Text(workshop.description)
                            .padding(.bottom, 20)
                            .foregroundColor(.black)
                        GlassButtonView(
                            buttonText: .scheduleButtonEnabled,
                            frameMaxWidth: .infinity,
                            frameMaxHeight: 1,
                            opacity: 0.3,
                            textColor: .textPrimary,
                            backgroundColor: .buttonColorActive,
                        ) {
                            
                        }
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
        .task {
            await workshopDetailVM.fetchWorkshop(workshopID: workshopID)
        }
    }
}

#Preview {
}
