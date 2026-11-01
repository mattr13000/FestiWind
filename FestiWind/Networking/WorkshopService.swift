//
//  WorkshopService.swift
//  FestiWind
//
//  Created by Apprenant 77 on 28/10/2026.
//

struct WorkshopService {
    private let webService = WebService()
 
    func getWorkshops() async throws -> [Workshop] {
        let response: [WorkshopDTO] = try await webService.request("workshops")
        return response.map{Workshop($0)}
    }
}
