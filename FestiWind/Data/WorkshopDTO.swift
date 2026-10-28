//
//  WorkshopDTO.swift
//  FestiWind
//
//  Created by Apprenant 87 on 18/09/2026.
//

import Foundation

struct WorkshopDTO: Decodable {
    let id: UUID
    let name: String
    let description: String
    //let startTime: Date
    //let endTime: Date
    let capacityMax: Int
    let totalSubscribers: Int
    let category: String
}
