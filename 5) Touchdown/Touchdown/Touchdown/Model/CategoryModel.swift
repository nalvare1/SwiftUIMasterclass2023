//
//  CategoryModel.swift
//  Touchdown
//
//  Created by Natalie Alvarez on 5/30/23.
//

import Foundation

struct Category: Codable, Identifiable {
    let id: Int
    let name: String
    let image: String
}
