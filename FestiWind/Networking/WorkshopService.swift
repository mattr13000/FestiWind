//
//  WorkshopService.swift
//  FestiWind
//
//  Created by Apprenant 77 on 28/10/2026.
//

struct WorkshopService {
    private let api = APIClient()
 
    func getWorkshops() async throws -> [Workshop] {
        let response: [WorkshopDTO] = try await api.request(
            "workshops",
            method: HTTPMethod.get.rawValue,
            body: nil
        )
        return response.map{Workshop($0)}
    }
}
