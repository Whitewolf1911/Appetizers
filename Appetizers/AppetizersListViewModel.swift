//
//  AppetizersListViewModel.swift
//  Appetizers
//
//  Created by Ali Basoglu on 5.11.2025.
//

import Combine
import Foundation

final class AppetizersListViewModel: ObservableObject {
    @Published var appetizers: [Appetizer] = []
    @Published var alertItem: AlertItem? = nil
    @Published var isLoading: Bool = false

    init() {
        getAppetizers()
    }

    private func getAppetizers() {
        isLoading = true
        NetworkManager.shared.getAppetizers { result in
            DispatchQueue.main.async {
                self.isLoading = false
                switch result {
                case .success(let appetizers):
                    self.appetizers = appetizers

                case .failure(let error):
                    self.setAlertItem(error: error)
                }
            }
        }
    }

    private func setAlertItem(error: AppetizersError) {
        switch error {
        case .invalidData:
            alertItem = AlertContext.invalidData
        case .invalidURL:
            alertItem = AlertContext.invalidURL
        case .invalidResponse:
            alertItem = AlertContext.invalidResponse
        case .unableToCompleteRequest:
            alertItem = AlertContext.unableToCompleteRequest
        }
    }
}
