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
    private var userBookings: [Reservation] {store.userBookings}
    
    private let loadingDuration: Duration = .milliseconds(800)
    private let successDuration: Duration = .milliseconds(1200)
    
    private(set) var loadingWorkshopIDs: Set<UUID> = []
    private(set) var justBookedWorkshopIDs: Set<UUID> = []
    
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
        loadingWorkshopIDs.insert(workshopID)
        async let delay = Task.sleep(for: duration)
        do {
            try await store.postReservation(workshopID: workshopID)
            await loadAll()
        } catch {
            errorMessage = .scheduleBookingError
        }
        try? await delay
        loadingWorkshopIDs.remove(workshopID)
    }
    
    func getBookingState(workshop: Workshop) -> BookingStatus {
        if (loadingWorkshopIDs.contains(workshop.id)) {
            return .pendingRequest
        }
        
        if (userBookings.contains(where: {$0.workshopID == workshop.id})) {
            return .alreadyBooked
        }
        
        if (workshop.remainingSlots <= 0) {
            return .workshopFull
        }
        
        return .bookingAvailable
    }
}
