//
//  FestivalStore.swift
//  FestiWind
//
//  Created by Apprenant 77 on 01/11/2026.
//

import SwiftUI

@Observable
final class FestivalStore {
    var userBookings: [Reservation] = []
    var workshops: [Workshop] = []
}
