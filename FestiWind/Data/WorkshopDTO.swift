//
//  WorkshopDTO.swift
//  FestiWind
//
//  Created by Apprenant 87 on 18/09/2026.
//

import Foundation

struct WorkshopDTO: Decodable, Identifiable {
    let id: UUID
    let name: String
    let description: String
    let start_time: Date
    let end_time: Date
    let capacity_max: Int
    let total_subscribers: Int
    let category: String
}
