//
// SearchBooks200Response.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct SearchBooks200Response: Codable, JSONEncodable, Hashable {

    /** The total number of books found. */
    public var numFound: Int?
    /** The starting index of the results. */
    public var start: Int?
    public var docs: [Book]?

    public init(numFound: Int? = nil, start: Int? = nil, docs: [Book]? = nil) {
        self.numFound = numFound
        self.start = start
        self.docs = docs
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case numFound = "num_found"
        case start
        case docs
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(numFound, forKey: .numFound)
        try container.encodeIfPresent(start, forKey: .start)
        try container.encodeIfPresent(docs, forKey: .docs)
    }
}

