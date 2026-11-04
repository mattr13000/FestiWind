//
//  ButtonBookingStatus.swift
//  FestiWind
//
//  Created by Apprenant 77 on 01/11/2026.
//

import SwiftUI

enum BookingStatus {
    case bookingAvailable
    case alreadyBooked
    case workshopFull
    case pendingRequest
    
    var resource: LocalizedStringResource {
        switch self {
        case .bookingAvailable:
            return .scheduleButtonEnabled
        case .alreadyBooked:
            return .scheduleButtonDisabledBooked
        case .workshopFull:
            return .scheduleButtonDisabledFull
        case .pendingRequest:
            return .commonPendingLabel
        }
    }
    
    var buttonState: Bool {
            switch self {
            case .bookingAvailable:
                return false
            case .alreadyBooked:
                return true
            case .workshopFull:
                return true
            case .pendingRequest:
                return true
            }
        }
}
