//
//  AccountViewModel.swift
//  Appetizers
//
//  Created by Ali Basoglu on 10.11.2025.
//

import Combine
import SwiftUI

final class AccountViewModel: ObservableObject {

    @AppStorage("user") private var userData: Data?
    @Published var user = User()
    @Published var alertItem: AlertItem? = nil

    init() {
        retrieveUser()
    }
    
    func onSaveClick() {
        validateAndSaveUser()
    }

    private func validateAndSaveUser() {
        guard
            !user.firstName.isEmpty
                && !user.lastName.isEmpty
                && !user.email.isEmpty
        else {
            alertItem = AlertContext.emptyFieldError
            return
        }

        guard user.email.isValidEmail else {
            alertItem = AlertContext.invalidEmail
            return
        }

        saveUser()
        return
    }

    private func saveUser() {
        do {
            let data = try JSONEncoder().encode(user)
            userData = data
            alertItem = AlertContext.infoSavedSuccessfully
        } catch {
            alertItem = AlertContext.invalidUserData
        }
    }

    private func retrieveUser() {
        guard let userData = userData else { return }

        do {
            user = try JSONDecoder().decode(User.self, from: userData)
        } catch {
            alertItem = AlertContext.invalidUserData
        }

    }
}
