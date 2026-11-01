//
//  ReservationManager.swift
//  FestiWind
//
//  Created by Apprenant 77 on 01/11/2026.
//

import SwiftUI

@Observable
final class FestivalStore {
    private let reservationService = ReservationService()
    private let workshopService = WorkshopService()
    
    var bookingsList: [Reservation] = []
    var workshopList: [Workshop] = []
    
    func getUserReservationsList() async throws {
        bookingsList = try await reservationService.getUserReservations()
    }
    
    func getWorkshopList() async throws {
        workshopList = try await workshopService.getWorkshops()
    }
}
