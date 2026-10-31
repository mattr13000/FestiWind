//
//  ReservationService.swift
//  FestiWind
//
//  Created by Apprenant 77 on 29/10/2026.
//

import Foundation

struct ReservationService {
    private let webService = WebService()
    
    func getUserReservations() async throws -> [Reservation] {
        let response: UserReservationsDTO = try await webService.request(
            "reservations/me",
            requiresAuth: true
        )
        return response.workshopReservationsDTO.map{Reservation($0)}
    }
    
    func postReservation(workshopID: UUID) async throws -> Reservation {
        let response: ReservationDTO = try await webService.request(
            "reservations",
            method: .post,
            body: ""
        )
        return Reservation(response)
    }
    
    func cancelReservation() async throws {
        let response: [WorkshopDTO] = try await webService.request(
            "reservations",
            method: .patch,
            body: ""
        )
    }
}
