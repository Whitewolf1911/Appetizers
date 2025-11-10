//
//  User.swift
//  Appetizers
//
//  Created by Ali Basoglu on 10.11.2025.
//

import Foundation

struct User: Codable {
    var firstName = ""
    var lastName = ""
    var email = ""
    var birthdate = Date()
    var extraNapkins = false
    var frequentRefills = false
}
