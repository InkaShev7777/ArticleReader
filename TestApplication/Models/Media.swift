//
//  Media.swift
//  TestApplication
//
//  Created by Ilya Schevchenko on 20.06.2024.
//

import Foundation

struct Media: Codable {
    let metaData: [MediaMetadata]
    let type: String

    enum CodingKeys: String, CodingKey {
        case metaData = "media-metadata"
        case type
    }
}
