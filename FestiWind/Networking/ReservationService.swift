//
//  ReservationService.swift
//  FestiWind
//
//  Created by Apprenant 77 on 29/10/2026.
//


struct ReservationService {
    private let api = APIClient()
    
    func getUserReservations() async throws -> [Reservation] {
        let response: [ReservationDTO] = try await api.request("reservations")
        return response.map{Reservation($0)}
    }
    
    func postReservation() async throws {
        let response: [WorkshopDTO] = try await api.request(
            "reservations",
            method: .post,
            body: ""
        )
    }
    
    func cancelReservation() async throws {
        let response: [WorkshopDTO] = try await api.request(
            "reservations",
            method: .patch,
            body: ""
        )
    }
}
