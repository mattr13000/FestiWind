//
//  Workshop.swift
//  FestiWind
//
//  Created by Apprenant 87 on 18/09/2026.
//

import Foundation

struct Workshop: Identifiable {
    let id: UUID
    let name: String
    let description: String
    let startTime: Date
    let endTime: Date
    let capacityMax: Int
    let totalSubscribers: Int
    let category: String
}

extension Workshop {
    init(_ dto: WorkshopDTO) {
        self.id = dto.id
        self.name = dto.name
        self.description = dto.description
        self.startTime = dto.start_time
        self.endTime = dto.end_time
        self.capacityMax = dto.capacity_max
        self.totalSubscribers = dto.total_subscribers
        self.category = dto.category
    }
}
