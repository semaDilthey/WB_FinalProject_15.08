//
//  BookService.swift
//  WB_FinalProject
//
//  Created by Анастасия on 12.08.2024.
//

import Foundation
import Alamofire
import BookAPI
import Combine

protocol Networking {
    func fetch<T: Decodable>(endpoint: String, parameters: [String: Any], responseType: T.Type) -> AnyPublisher<T, Error>
}

final class AlomofireService: Networking {
    private let baseURL: String
    
    init(baseURL: String) {
        self.baseURL = baseURL
    }
    
    func fetch<T: Decodable>(endpoint: String, parameters: [String: Any] = [:], responseType: T.Type) -> AnyPublisher<T, Error> {
        let url = "\(baseURL)\(endpoint)"
        
        return AF.request(url, parameters: parameters)
            .validate()
            .publishDecodable(type: T.self)
            .value()
            .mapError { $0 as Error }
            .eraseToAnyPublisher()
    }
}

