//
//  Results.swift
//  TestApplication
//
//  Created by Ilya Schevchenko on 20.06.2024.
//

import Foundation

struct Results: Codable {
    let url: String
    let source: String
    let publishedDate: String
    let updated: String
    let title: String
    let media: [Media]
    let section: String
    let abstract: String

    enum CodingKeys: String, CodingKey {
        case url
        case source
        case publishedDate = "published_date"
        case updated
        case title
        case media
        case section
        case abstract
    }
}
