//
//  ScheduleViewModel.swift
//  FestiWind
//
//  Created by Apprenant 87 on 18/09/2026.
//

import SwiftUI

@Observable
final class ScheduleViewModel {
    private let store: FestivalStore
    
    var workshops: [Workshop] {store.workshops}
    var userBookings: [Reservation] {store.userBookings}
    
    var errorMessage: LocalizedStringResource?
    
    init(store: FestivalStore) {
        self.store = store
    }
    
    func loadAll() async {
        do {
            try await store.getAll()
        } catch {
            errorMessage = .commonRequestError
        }
    }
    
    func postReservation(workshopID: UUID) async {
        do {
            try await store.postReservation(workshopID: workshopID)
            try await store.getAll()
        } catch {
            errorMessage = .scheduleBookingError
        }
    }
    
    func getBookingState(workshop: Workshop) -> BookingStatus {
        if (userBookings.contains(where: {$0.workshopID == workshop.id})) {
            return .alreadyBooked
        }
        
        if (workshop.remainingSlots <= 0) {
            return .workshopFull
        }
        
        return .bookingAvailable
    }
}
