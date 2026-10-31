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
    var bookingsList: [Reservation] = []
    var errorMessage: LocalizedStringResource?
    
    func getUserReservationsList() async {
        do {
            bookingsList = try await reservationService.getUserReservations()
        }
        catch {
            errorMessage = .bookingsRequestError
        }
    }
    
    func cancelReservation(reservationID: UUID) async throws {
        do {
            try await reservationService.cancelReservation(reservationID: reservationID)
        }
        catch {
            errorMessage = .bookingsCancelError
        }
    }
}
