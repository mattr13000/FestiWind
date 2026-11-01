//
//  ReservationManager.swift
//  FestiWind
//
//  Created by Apprenant 77 on 01/11/2026.
//

import SwiftUI

@Observable
final class ReservationManager {
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
}
