//
//  Result.swift
//  TestApplication
//
//  Created by Ilya Schevchenko on 20.06.2024.
//

import Foundation

struct Result: Codable {
    let url: String
    let source: String
    let publishedDate: String
    let updated: String
    let title: String
    let media: [Media]

    enum CodingKeys: String, CodingKey {
        case url
        case source
        case publishedDate = "published_date"
        case updated
        case title
        case media
    }
}
