//
//  Constant.swift
//  Avocados
//
//  Created by Natalie Alvarez on 7/7/23.
//

import SwiftUI

// Assets:
struct AvocadoIcon: Identifiable {
    var id = UUID()
    var title: String
    var imageName: String
    var isLeft: Bool
}

let avocadoIcons: [AvocadoIcon] = [
    AvocadoIcon(title: "Toasts", imageName: "icon-toasts", isLeft: true),
    AvocadoIcon(title: "Tacos", imageName: "icon-tacos", isLeft: true),
    AvocadoIcon(title: "Salads", imageName: "icon-salads", isLeft: true),
    AvocadoIcon(title: "Spreads", imageName: "icon-halfavo", isLeft: true),

    AvocadoIcon(title: "Guacamole", imageName: "icon-guacamole", isLeft: false),
    AvocadoIcon(title: "Sandwiches", imageName: "icon-sandwiches", isLeft: false),
    AvocadoIcon(title: "Soups", imageName: "icon-soup", isLeft: false),
    AvocadoIcon(title: "Smoothies", imageName: "icon-smoothies", isLeft: false)
]

let leftAvocadoIcons: [AvocadoIcon] = avocadoIcons.filter{ $0.isLeft }

let rightAvocadoIcons: [AvocadoIcon] = avocadoIcons.filter{ !$0.isLeft }
