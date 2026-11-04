//
//  User.swift
//  FestiWind
//
//  Created by Apprenant 87 on 18/09/2026.
//

import Foundation

struct User: Identifiable {
    let id: UUID
}

extension User {
    init(_ dto: UserDTO) {
        self.id = dto.id
    }
}
