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
    let workshopName: String
    let startTime: Date
    let endTime: Date
}

extension Reservation {
    init(_ dto: ReservationDTO) {
        self.id = dto.id
        self.status = dto.status
        self.workshopName = dto.workshopName
        self.startTime = dto.startTime
        self.endTime = dto.endTime
    }
}
