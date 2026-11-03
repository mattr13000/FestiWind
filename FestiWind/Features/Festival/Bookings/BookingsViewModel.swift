//
//  BookingsViewModel.swift
//  FestiWind
//
//  Created by Apprenant 77 on 31/10/2026.
//

import SwiftUI

@Observable
final class BookingsViewModel {
    private let manager: FestivalManager

    var userBookings: [Reservation] {manager.store.userBookings}
    
    var errorMessage: LocalizedStringResource?
    
    init(manager: FestivalManager) {
        self.manager = manager
    }
    
    func loadBookings() async {
        do {
            try await manager.getUserReservations()
        } catch {
            errorMessage = .bookingsRequestError
        }
    }
    
    func loadAll() async {
        do {
            try await manager.getAll()
        } catch {
            errorMessage = .bookingsRequestError
        }
    }

    func cancelReservation(reservationID: UUID) async {
        do {
            try await manager.cancelReservation(reservationID: reservationID)
            await loadAll()
        }
        catch {
            errorMessage = .bookingsCancelError
        }
    }
}
