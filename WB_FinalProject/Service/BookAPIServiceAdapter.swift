//
//  BookAPIServiceAdapter.swift
//  WB_FinalProject
//
//  Created by Семен Гайдамакин on 17.08.2024.
//

import Foundation
import BookAPI
import Combine

final class BookAPIServiceAdapter {}

extension BookAPIServiceAdapter: Networking {
    
    func fetch<T: Decodable>(endpoint: String, parameters: [String: Any] = [:], responseType: T.Type) -> AnyPublisher<T, Error> {
        Future<T, Error> { promise in
            DefaultAPI.searchBooks(q: parameters["q"] as? String ?? "") { data, error in
                if let data = data {
                    let convertedData = data.toSearchResponse() as? T
                    if let convertedData {
                        promise(.success(convertedData))
                    } else {
                        promise(.failure(NSError(domain: "Cannt convert data", code: -2, userInfo: nil)))
                    }
                } else if let error = error {
                    promise(.failure(error))
                } else {
                    promise(.failure(NSError(domain: "Unknown error", code: -1, userInfo: nil)))
                }
            }
        }
        .eraseToAnyPublisher()
    }
}

extension SearchBooks200Response {
    
    func toSearchResponse() -> SearchResponse {
        return SearchResponse(numFound: 0, start: 0, docs: self.docs.map { doc in
            return doc.map { book in
                return BookResponse(title: book.title ?? "No title",
                                    author_name: book.authorName,
                                    cover_i: book.coverI,
                                    first_publish_year: book.firstPublishYear,
                                    ratings_average: book.rating,
                                    subject: book.subject,
                                    language: book.language
                )}
        }!)
    }
}
