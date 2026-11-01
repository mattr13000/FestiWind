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
    var errorMessage: LocalizedStringResource?
    
    func cancelReservation(reservationID: UUID) async {
        do {
            try await reservationService.cancelReservation(reservationID: reservationID)
        }
        catch {
            errorMessage = .bookingsCancelError
        }
    }
}
