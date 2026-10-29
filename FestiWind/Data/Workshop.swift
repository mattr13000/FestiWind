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
    //let startTime: Date
    //let endTime: Date
    let capacityMax: Int
    let totalSubscribers: Int
    var remainingSlots: Int {capacityMax - totalSubscribers}
    let category: String
}

extension Workshop {
    init(_ dto: WorkshopDTO) {
        self.id = dto.id
        self.name = dto.name
        self.description = dto.description
        //self.startTime = dto.startTime
        //self.endTime = dto.endTime
        self.capacityMax = dto.capacityMax
        self.totalSubscribers = dto.totalSubscribers
        self.category = dto.category
    }
}
