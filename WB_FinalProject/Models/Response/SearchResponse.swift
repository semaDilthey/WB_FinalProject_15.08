//
//  SearchResponse.swift
//  WB_FinalProject
//
//  Created by Анастасия on 12.08.2024.
//

import Foundation

struct SearchResponse: Codable {
    let numFound: Int
    let start: Int
    let docs: [BookResponse]
}
