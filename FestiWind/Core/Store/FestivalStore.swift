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
    
    var errorMessage: LocalizedStringResource?
    
    func getUserReservationsList() async {
        do {
            bookingsList = try await reservationService.getUserReservations()
        }
        catch {
            errorMessage = .bookingsRequestError
        }
    }
    
    func getWorkshopList() async {
        do {
            workshopList = try await workshopService.getWorkshops()
        }
        catch {
            errorMessage = .scheduleRequestError
        }
    }
    
    func getBookingState(workshop: Workshop) -> BookingStatus {
        if (bookingsList.contains(where: {$0.workshopID == workshop.id})) {
            return .alreadyBooked
        }
        
        if (workshop.remainingSlots == 0) {
            return .workshopFull
        }
        
        return .bookingAvailable
    }
}
