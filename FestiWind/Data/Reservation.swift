//
//  Reservation.swift
//  FestiWind
//
//  Created by Apprenant 87 on 18/09/2026.
//

import Foundation

struct Reservation: Identifiable {
    let id: UUID
    let status: String
}

extension Reservation {
    init(_ dto: ReservationDTO) {
        self.id = dto.id
        self.status = dto.status
    }
}
