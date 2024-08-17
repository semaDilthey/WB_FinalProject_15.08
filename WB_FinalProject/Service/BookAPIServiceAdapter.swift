//
//  BookAPIServiceAdapter.swift
//  WB_FinalProject
//
//  Created by Семен Гайдамакин on 17.08.2024.
//

import Foundation
import BookAPI
import Combine

final class BookAPIServiceAdapter: Networking {
    
    func fetch<T: Decodable>(endpoint: String, parameters: [String: Any] = [:], responseType: T.Type) -> AnyPublisher<T, Error> {
        Future<T, Error> { promise in
            DefaultAPI.searchBooks(q: parameters["q"] as? String ?? "") { data, error in
                if let data = data as? T {
                    promise(.success(data))
                } else if let error = error {
                    promise(.failure(error))
                }
            }
        }
        .eraseToAnyPublisher()
    }
    
}
