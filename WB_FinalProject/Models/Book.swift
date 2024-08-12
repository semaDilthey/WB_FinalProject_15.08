//
//  Book.swift
//  WB_FinalProject
//
//  Created by Анастасия on 12.08.2024.
//

import Foundation

struct Book: Codable, Equatable, Hashable {
    let title: String
    let author_name: [String]?
    let cover_i: Int?
}
