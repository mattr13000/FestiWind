//
//  ScheduleViewModel.swift
//  FestiWind
//
//  Created by Apprenant 87 on 18/09/2026.
//

import SwiftUI

@Observable
final class ScheduleViewModel {
    private let workshopService = WorkshopService()
    private let reservationService = ReservationService()
    var workshopList: [Workshop] = []
    var errorMessage: LocalizedStringResource?
    
    func getWorkshopList() async {
        do {
            workshopList = try await workshopService.getWorkshops()
        }
        catch {
            errorMessage = .scheduleRequestError
        }
    }
    
    func isThisButtonDisabled(remainingSlots: Int) -> Bool {
        return remainingSlots == 0 ? true : false
    }
    
    func postReservation(workshopID: UUID) async {
        do {
            try await reservationService.postReservation(workshopID: workshopID)
        } catch {
            errorMessage = .scheduleBookingError
        }
    }
}
