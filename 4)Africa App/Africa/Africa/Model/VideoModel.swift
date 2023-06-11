//
//  VideoModel.swift
//  Africa
//
//  Created by Natalie Alvarez on 5/24/23.
//

import Foundation

struct Video: Codable, Identifiable {
    let id: String
    let name: String
    let headline: String

    // Computed Property:
    var thumbnail: String {
        "video-\(id)"
    }
}

