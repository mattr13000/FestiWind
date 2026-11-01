//
//  ScheduleViewModel.swift
//  FestiWind
//
//  Created by Apprenant 87 on 18/09/2026.
//

import SwiftUI

@Observable
final class ScheduleViewModel {
    private let workshopService = WorkshopService()
    private let reservationService = ReservationService()
    
    var workshopList: [Workshop] {store.workshopList}
    var bookingsList: [Reservation] {store.bookingsList}
    
    var errorMessage: LocalizedStringResource?
    
    private let store: FestivalStore
    
    init(store: FestivalStore) {
        self.store = store
    }
    
    func postReservation(workshopID: UUID) async {
        do {
            try await reservationService.postReservation(workshopID: workshopID)
        } catch {
            errorMessage = .scheduleBookingError
        }
    }
    
    func getBookingState(workshop: Workshop) -> BookingStatus {
        if (bookingsList.contains(where: {$0.workshopID == workshop.id})) {
            return .alreadyBooked
        }
        
        if (workshop.remainingSlots == 0) {
            return .workshopFull
        }
        
        return .bookingAvailable
    }
}
