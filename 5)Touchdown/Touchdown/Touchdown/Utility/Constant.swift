//
//  Constant.swift
//  Touchdown
//
//  Created by Natalie Alvarez on 5/30/23.
//

import SwiftUI

// API:

// Color:
let colorBackground: Color = Color("ColorBackground")
let colorGray: Color = Color(UIColor.systemGray4)

// Data:
let brands: [Brand] = Bundle.main.decode("brand.json")
let categories: [Category] = Bundle.main.decode("category.json")
let players: [Player] = Bundle.main.decode("player.json")
let products: [Product] = Bundle.main.decode("product.json")
let sampleProduct: Product = products[0]

// Image:

// Font:

// Layout:
let columnSpacing: CGFloat = 10
let rowSpacing: CGFloat = 10
var gridLayout: [GridItem] {
    return Array(repeating: GridItem(.flexible(), spacing: rowSpacing), count: 2)
}

// String:

// UX:
let haptics = UIImpactFeedbackGenerator(style: .medium)


