//
//  FestivalManager.swift
//  FestiWind
//
//  Created by Apprenant 77 on 02/11/2026.
//

import Foundation

final class FestivalManager {
    let store = FestivalStore()

    private let reservationService = ReservationService()
    private let workshopService = WorkshopService()

    func getUserReservations() async throws {
        store.userBookings = try await reservationService.getUserReservations()
    }
    
    func showWorkshop(workshopID: UUID) async throws -> Workshop {
        return try await workshopService.showWorkshop(workshopID: workshopID)
    }

    func getAll() async throws {
        try await getUserReservations()
        store.workshops = try await workshopService.getWorkshops()
    }

    func postReservation(workshopID: UUID) async throws {
        try await reservationService.postReservation(workshopID: workshopID)
    }

    func cancelReservation(reservationID: UUID) async throws {
        try await reservationService.cancelReservation(reservationID: reservationID)
    }
}
