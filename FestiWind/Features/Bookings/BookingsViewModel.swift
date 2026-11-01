//
//  BookingsViewModel.swift
//  FestiWind
//
//  Created by Apprenant 77 on 31/10/2026.
//

import SwiftUI

@Observable
final class BookingsViewModel {
    private let store: FestivalStore
    
    var userBookings: [Reservation] {store.userBookings}
    
    var errorMessage: LocalizedStringResource?
    
    init(store: FestivalStore) {
        self.store = store
    }
    
    func loadBookings() async {
        do {
            try await store.getUserReservations()
        } catch {
            errorMessage = .bookingsRequestError
        }
    }
    
    func loadAll() async {
        do {
            try await store.getAll()
        } catch {
            errorMessage = .bookingsRequestError
        }
    }

    func cancelReservation(reservationID: UUID) async {
        do {
            try await store.cancelReservation(reservationID: reservationID)
            await loadAll()
        }
        catch {
            errorMessage = .bookingsCancelError
        }
    }
}
