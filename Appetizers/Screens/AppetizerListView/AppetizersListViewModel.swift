//
//  AppetizersListViewModel.swift
//  Appetizers
//
//  Created by Ali Basoglu on 5.11.2025.
//

import Combine
import Foundation

@MainActor final class AppetizersListViewModel: ObservableObject {
    @Published var appetizers: [Appetizer] = []
    @Published var alertItem: AlertItem? = nil
    @Published var isLoading: Bool = false
    @Published var selectedAppetizer: Appetizer? = nil
    @Published var isDetailViewVisible: Bool = false

    init() {
        getAppetizers()
    }

    func onAppetizerClick(appetizer: Appetizer) {
        selectedAppetizer = appetizer
        isDetailViewVisible = true
    }

    func onAppetizerDetailDismissClick() {
        isDetailViewVisible = false
    }

    func getAppetizers() {
        isLoading = true
        Task {
            do {
                appetizers = try await NetworkManager.shared.getAppetizers()
                isLoading = false
            } catch {
                if let appetizerError = error as? AppetizersError {
                    setAlertItem(error: appetizerError)
                } else {
                    setAlertItem(error: AppetizersError.invalidResponse)
                }

                isLoading = false
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
