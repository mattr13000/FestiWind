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
    
    var workshops: [Workshop] {store.workshops}
    var userBookings: [Reservation] {store.userBookings}
    
    var errorMessage: LocalizedStringResource?
    
    private let store: FestivalStore
    
    init(store: FestivalStore) {
        self.store = store
    }
    
    func loadWorkshops() async {
        do {
            try await store.getWorkshops()
        } catch {
            errorMessage = .scheduleRequestError
        }
    }
    
    func loadBookings() async {
        do {
            try await store.getUserReservations()
        } catch {
            errorMessage = .bookingsRequestError
        }
    }
    
    func postReservation(workshopID: UUID) async {
        do {
            try await store.postReservation(workshopID: workshopID)
        } catch {
            errorMessage = .scheduleBookingError
        }
    }
    
    func getBookingState(workshop: Workshop) -> BookingStatus {
        if (userBookings.contains(where: {$0.workshopID == workshop.id})) {
            return .alreadyBooked
        }
        
        if (workshop.remainingSlots == 0) {
            return .workshopFull
        }
        
        return .bookingAvailable
    }
}
