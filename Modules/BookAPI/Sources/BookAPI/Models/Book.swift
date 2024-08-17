//
// BookResponse.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct Book: Codable, JSONEncodable, Hashable {

    /** ID of the cover image. */
    public var coverI: Int?
    /** Indicates if the book has full-text available. */
    public var hasFulltext: Bool?
    /** The total number of editions of the book. */
    public var editionCount: Int?
    /** The title of the book. */
    public var title: String?
    /** List of authors' names. */
    public var authorName: [String]?
    /** The year the book was first published. */
    public var firstPublishYear: Int?
    /** The unique key identifier for the work. */
    public var key: String?
    /** Internet Archive identifiers for the book's editions. */
    public var ia: [String]?
    /** The unique key identifiers for the authors. */
    public var authorKey: [String]?
    /** Whether the book is available for public scanning. */
    public var publicScanB: Bool?

    public init(coverI: Int? = nil, hasFulltext: Bool? = nil, editionCount: Int? = nil, title: String? = nil, authorName: [String]? = nil, firstPublishYear: Int? = nil, key: String? = nil, ia: [String]? = nil, authorKey: [String]? = nil, publicScanB: Bool? = nil) {
        self.coverI = coverI
        self.hasFulltext = hasFulltext
        self.editionCount = editionCount
        self.title = title
        self.authorName = authorName
        self.firstPublishYear = firstPublishYear
        self.key = key
        self.ia = ia
        self.authorKey = authorKey
        self.publicScanB = publicScanB
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case coverI = "cover_i"
        case hasFulltext = "has_fulltext"
        case editionCount = "edition_count"
        case title
        case authorName = "author_name"
        case firstPublishYear = "first_publish_year"
        case key
        case ia
        case authorKey = "author_key"
        case publicScanB = "public_scan_b"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(coverI, forKey: .coverI)
        try container.encodeIfPresent(hasFulltext, forKey: .hasFulltext)
        try container.encodeIfPresent(editionCount, forKey: .editionCount)
        try container.encodeIfPresent(title, forKey: .title)
        try container.encodeIfPresent(authorName, forKey: .authorName)
        try container.encodeIfPresent(firstPublishYear, forKey: .firstPublishYear)
        try container.encodeIfPresent(key, forKey: .key)
        try container.encodeIfPresent(ia, forKey: .ia)
        try container.encodeIfPresent(authorKey, forKey: .authorKey)
        try container.encodeIfPresent(publicScanB, forKey: .publicScanB)
    }
}

