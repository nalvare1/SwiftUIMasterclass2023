//
//  ProductsView.swift
//  Touchdown
//
//  Created by Natalie Alvarez on 5/30/23.
//

import SwiftUI

struct ProductsView: View {
    @EnvironmentObject var shop: Shop

    var body: some View {
        VStack {
            TitleView(title: "Helmets")

            LazyVGrid(columns: gridLayout, spacing: 15, content: {
                ForEach(products) { product in
                    ProductItemView(product: product)
                        .onTapGesture {
                            haptics.impactOccurred()
                            withAnimation(.easeOut) {
                                shop.selectedProduct = product
                                shop.showingProduct = true
                            }
                        }
                }
            })
        }
    }
}

#Preview {
    ProductsView()
        .previewLayout(.sizeThatFits)
        .padding()
        .background(colorBackground)
        .environmentObject(Shop())
}
