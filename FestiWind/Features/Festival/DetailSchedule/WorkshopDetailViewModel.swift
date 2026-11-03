//
//  WorkshopDetailViewModel.swift
//  FestiWind
//
//  Created by Apprenant 77 on 03/11/2026.
//

import SwiftUI

@Observable
final class WorkshopDetailViewModel {
    private let manager: FestivalManager
    var workshop: Workshop?

    var errorMessage: LocalizedStringResource?
    var isBooking: Bool = false

    private var userBookings: [Reservation] {manager.store.userBookings}
    private let duration: Duration = .milliseconds(800)

    init(manager: FestivalManager) {
        self.manager = manager
    }

    func fetchWorkshop(workshopID: UUID) async {
        do {
            try workshop = await manager.showWorkshop(workshopID: workshopID)
        } catch {
            errorMessage = .commonRequestError
        }
    }

    func postReservation(workshopID: UUID) async {
        isBooking = true
        async let delay = Task.sleep(for: duration)
        do {
            try await manager.postReservation(workshopID: workshopID)
            try await manager.getAll()
            await fetchWorkshop(workshopID: workshopID)
        } catch {
            errorMessage = .scheduleBookingError
        }
        try? await delay
        isBooking = false
    }

    func getBookingState(workshop: Workshop) -> BookingStatus {
        if isBooking {
            return .pendingRequest
        }

        if userBookings.contains(where: {$0.workshopID == workshop.id}) {
            return .alreadyBooked
        }

        if workshop.remainingSlots <= 0 {
            return .workshopFull
        }

        return .bookingAvailable
    }
}
