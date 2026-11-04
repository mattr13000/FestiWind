//
//  String.isValidEmail.swift
//  FestiWind
//
//  Created by Apprenant 77 on 02/11/2026.
//

extension String {
    var isValidEmail: Bool {
        let emailRegex = /^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$/
        return self.wholeMatch(of: emailRegex) != nil
    }
}
