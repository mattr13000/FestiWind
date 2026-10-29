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
    var workshopList: [Workshop] = []
    var errorMessage: LocalizedStringResource?
    
    func getWorkshopList() async {
        do {
            workshopList = try await workshopService.getWorkshops()
        }
        catch {
            errorMessage = .scheduleRequestError
            // Remove it once feature done
            print(error)
        }
    }
}
