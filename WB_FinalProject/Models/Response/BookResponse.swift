//
//  BookResponse.swift
//  WB_FinalProject
//
//  Created by Анастасия on 12.08.2024.
//

import Foundation

protocol BookResponseInterface: Codable, Hashable {
    var title: String { get }
    var author_name: [String]? { get }
    var cover_i: Int? { get }
}

struct BookResponse: BookResponseInterface {
    let title: String
    let author_name: [String]?
    let cover_i: Int?
}
