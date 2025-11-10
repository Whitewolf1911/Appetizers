//
//  Alert.swift
//  Appetizers
//
//  Created by Ali Basoglu on 6.11.2025.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}

struct AlertContext {
    static let invalidURL = AlertItem(
        title: Text("Invalid URL"),
        message: Text("URL is invalid."),
        dismissButton: .default(Text("OK"))
    )
    static let invalidResponse = AlertItem(
        title: Text("Invalid Response"),
        message: Text("Server sent an invalid response."),
        dismissButton: .default(Text("OK"))
    )

    static let invalidData = AlertItem(
        title: Text("Invalid Data"),
        message: Text("Received an invalid data. Please contact support."),
        dismissButton: .default(Text("OK"))
    )

    static let unableToCompleteRequest = AlertItem(
        title: Text("Unable To Complete Request"),
        message: Text("Sorry we are unable to complete request."),
        dismissButton: .default(Text("OK"))
    )

    static let invalidEmail = AlertItem(
        title: Text("Invalid Email"),
        message: Text("Please provide a valid email."),
        dismissButton: .default(Text("OK"))
    )

    static let emptyFieldError = AlertItem(
        title: Text("Empty Field"),
        message: Text("Please fill all the fields."),
        dismissButton: .default(Text("OK"))
    )

    static let infoSavedSuccessfully = AlertItem(
        title: Text("Success"),
        message: Text("Informations saved successfully."),
        dismissButton: .default(Text("OK"))
    )

    static let invalidUserData = AlertItem(
        title: Text("Profile Error"),
        message: Text("There was an error saving or retrieving your profile. Please try again."),
        dismissButton: .default(Text("OK"))
    )
}
