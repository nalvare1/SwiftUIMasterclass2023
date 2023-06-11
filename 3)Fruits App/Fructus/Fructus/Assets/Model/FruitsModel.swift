//
//  FruitsModel.swift
//  Fructus
//
//  Created by Natalie Alvarez on 5/17/23.
//

import SwiftUI

struct Fruit: Identifiable {
    var id = UUID()
    var title: String
    var headline: String
    var image: String
    var gradientColors: [Color]
    var description: String
    var nutrition: [String]
}
