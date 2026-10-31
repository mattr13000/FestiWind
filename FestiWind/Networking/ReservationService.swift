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
    
    func postReservation(workshopID: UUID) async throws {
        let _: ReservationDTO = try await webService.request(
            "reservations",
            method: .post,
            body: CreateReservationDTO(workshopID: workshopID),
            requiresAuth: true
        )
    }

    func cancelReservation(reservationID: UUID) async throws {
        let _: ReservationDTO = try await webService.request(
            "reservations/\(reservationID)",
            method: .put,
            body: UpdateReservationDTO(status: .cancelled),
            requiresAuth: true
        )
    }
}
