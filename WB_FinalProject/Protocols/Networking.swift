//
//  Networking.swift
//  WB_FinalProject
//
//  Created by Семен Гайдамакин on 17.08.2024.
//

import Foundation
import Combine

protocol Networking {
    func fetch<T: Decodable>(endpoint: String, 
                             parameters: [String: Any],
                             responseType: T.Type) -> AnyPublisher<T, Error>
}
