//
//  ScheduleViewModel.swift
//  FestiWind
//
//  Created by Apprenant 87 on 18/09/2026.
//

import SwiftUI

@Observable
final class ScheduleViewModel {
    private let manager: FestivalManager

    var workshops: [Workshop] {manager.store.workshops}
    private var userBookings: [Reservation] {manager.store.userBookings}
    
    private let duration: Duration = .milliseconds(800)
    
    private(set) var loadingWorkshopIDs: Set<UUID> = []
    
    var errorMessage: LocalizedStringResource?
    
    init(manager: FestivalManager) {
        self.manager = manager
    }
    
    func loadAll() async {
        do {
            try await manager.getAll()
        } catch {
            errorMessage = .commonRequestError
        }
    }
    
    func postReservation(workshopID: UUID) async {
        loadingWorkshopIDs.insert(workshopID)
        async let delay = Task.sleep(for: duration)
        do {
            try await manager.postReservation(workshopID: workshopID)
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
