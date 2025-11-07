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

    func getAppetizers(
        completed: @escaping (Result<[Appetizer], AppetizersError>) -> Void
    ) {
        guard let url = URL(string: baseUrl) else {
            completed(.failure(.invalidURL))
            return
        }

        let task = URLSession.shared.dataTask(
            with: URLRequest(url: url)
        ) {
            data,
            response,
            error in
            guard error == nil else {
                completed(.failure(.unableToCompleteRequest))
                return
            }

            guard let response = response as? HTTPURLResponse,
                response.statusCode == 200
            else {
                completed(.failure(.invalidResponse))
                return
            }

            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }

            do {
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode(
                    AppetizerResponse.self,
                    from: data
                )
                completed(.success(decodedResponse.request))
            } catch {
                completed(.failure(.invalidResponse))
            }
        }

        task.resume()
    }
}
