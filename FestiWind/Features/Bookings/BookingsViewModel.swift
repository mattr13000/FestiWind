//
//  BookingsViewModel.swift
//  FestiWind
//
//  Created by Apprenant 77 on 31/10/2026.
//

import SwiftUI

@Observable
final class BookingsViewModel {
    private let reservationService = ReservationService()
    private let store: FestivalStore
    
    var bookingsList: [Reservation] {store.bookingsList}
    
    var errorMessage: LocalizedStringResource?
    
    init(store: FestivalStore) {
        self.store = store
    }
    
    func cancelReservation(reservationID: UUID) async {
        do {
            try await reservationService.cancelReservation(reservationID: reservationID)
        }
        catch {
            errorMessage = .bookingsCancelError
        }
    }
}
