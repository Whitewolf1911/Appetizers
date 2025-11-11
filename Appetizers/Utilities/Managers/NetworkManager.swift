//
//  NetworkManager.swift
//  Appetizers
//
//  Created by Ali Basoglu on 4.11.2025.
//

import Foundation

final class NetworkManager {

    // creating singleton
    static let shared = NetworkManager()

    private let baseUrl = "https://api.npoint.io/dabf00be3f645918e015"

    private init() {}

    func getAppetizers() async throws -> [Appetizer] {
        guard let url = URL(string: baseUrl) else {
            throw AppetizersError.invalidURL
        }

        let (data, _) = try await URLSession.shared.data(from: url) // _ here is response
      
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(AppetizerResponse.self, from: data).request
        } catch {
            throw AppetizersError.invalidData
        }
    }
}
