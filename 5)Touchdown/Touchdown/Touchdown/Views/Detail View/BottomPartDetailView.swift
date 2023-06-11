//
//  BottomPartDetailView.swift
//  Touchdown
//
//  Created by Natalie Alvarez on 5/31/23.
//

import SwiftUI

struct BottomPartDetailView: View {
    @EnvironmentObject var shop: Shop
    
    var body: some View {
        VStack(alignment: .center, spacing: 0, content: {
            // Ratings and Sizes:
            RatingsSizesDetailView()
                .padding(.top, -20)
                .padding(.bottom, 10)

            // Description:
            ScrollView(.vertical, showsIndicators: false, content: {
                Text(shop.selectedProduct?.description ?? sampleProduct.description)
                    .font(.system(.body, design: .rounded))
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.leading)
            })

            // Quantity and Favorite:
            QuantityFavoriteDetailView()
                .padding(.vertical, 10)

            // Add To Cart:
            AddToCartButtonView()
                .padding(.bottom, 20)
        })
        .padding(.horizontal)
        .background(
            Color.white
                .clipShape(CustomShape())
                .padding(.top, -105)
        )
    }
}

#Preview {
    BottomPartDetailView()
        .environmentObject(Shop())
}
