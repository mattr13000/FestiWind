//
//  WorkshopDetailViewModel.swift
//  FestiWind
//
//  Created by Apprenant 77 on 03/11/2026.
//

import SwiftUI

@Observable
final class WorkshopDetailViewModel {
    private let manager: FestivalManager
    var workshop: Workshop?
    
    init(manager: FestivalManager) {
        self.manager = manager
    }
    
    
    
    func fetchWorkshop(workshopID: UUID) async {
        do {
            try workshop = await manager.showWorkshop(workshopID: workshopID)
        } catch {}
    }
}
