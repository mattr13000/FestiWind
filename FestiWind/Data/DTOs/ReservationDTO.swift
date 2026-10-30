//
//  Reservation.swift
//  FestiWind
//
//  Created by Apprenant 87 on 18/09/2026.
//

import Foundation

struct ReservationDTO: Decodable {
    let id: UUID
    let status: String
    let workshopName: String
    let startTime: Date
    let endTime: Date
}

struct UserReservationsDTO: Decodable {
    let workshopReservationsDTO: [ReservationDTO]
}

