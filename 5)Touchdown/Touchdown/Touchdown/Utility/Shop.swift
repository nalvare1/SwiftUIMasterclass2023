//
//  Shop.swift
//  Touchdown
//
//  Created by Natalie Alvarez on 5/31/23.
//

import Foundation

class Shop: ObservableObject {
    @Published var showingProduct: Bool = false // "@Published" means that any changes to these properties will trigger view reloads
    @Published var selectedProduct: Product? = nil
}
