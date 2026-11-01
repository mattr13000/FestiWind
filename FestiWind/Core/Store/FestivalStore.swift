//
//  ReservationManager.swift
//  FestiWind
//
//  Created by Apprenant 77 on 01/11/2026.
//

import SwiftUI

@Observable
final class FestivalStore {
    private let reservationService = ReservationService()
    private let workshopService = WorkshopService()
    
    var userBookings: [Reservation] = []
    var workshops: [Workshop] = []
    
    func getUserReservations() async throws {
        userBookings = try await reservationService.getUserReservations()
    }
    
    func getWorkshops() async throws {
        workshops = try await workshopService.getWorkshops()
    }
    
    func getAll() async throws {
        userBookings = try await reservationService.getUserReservations()
        workshops = try await workshopService.getWorkshops()
    }
    
    func postReservation(workshopID: UUID) async throws {
        try await reservationService.postReservation(workshopID: workshopID)
    }
    
    func cancelReservation(reservationID: UUID) async throws {
        try await reservationService.cancelReservation(reservationID: reservationID)
    }
}
