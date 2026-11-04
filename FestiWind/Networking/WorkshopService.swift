//
//  WorkshopService.swift
//  FestiWind
//
//  Created by Apprenant 77 on 28/10/2026.
//

import Foundation

struct WorkshopService {
    private let webService = WebService()
 
    func getWorkshops() async throws -> [Workshop] {
        let response: [WorkshopDTO] = try await webService.request("workshops")
        return response.map{Workshop($0)}
    }
    
    func showWorkshop(workshopID: UUID) async throws -> Workshop {
        let response: WorkshopDTO = try await webService.request("workshops/\(workshopID)")
        return Workshop(response)
    }
}
