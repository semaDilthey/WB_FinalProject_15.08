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
    var first_publish_year: Int? { get }
    var ratings_average: Double? { get }
    var subject: [String]? { get }
    var language: [String]? { get }
}

struct BookResponse: BookResponseInterface {
    let title: String
    let author_name: [String]?
    let cover_i: Int?
    let first_publish_year: Int?
    let ratings_average: Double?
    let subject: [String]?
    let language: [String]?
}
