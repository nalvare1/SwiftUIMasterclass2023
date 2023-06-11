//
//  ProductItemView.swift
//  Touchdown
//
//  Created by Natalie Alvarez on 5/30/23.
//

import SwiftUI

struct ProductItemView: View {
    let product: Product

    var body: some View {
        VStack(alignment: .leading, spacing: 6, content: {
            ZStack {
                Image(product.image)
                    .resizable()
                    .scaledToFit()
                    .padding(10)
            }
            .background(product.formattedColor)
            .cornerRadius(12)

            Text(product.name)
                .font(.title3)
                .fontWeight(.black)

            Text("\(product.formattedPrice)")
                .fontWeight(.semibold)
                .foregroundColor(.gray)
        })

    }
}

#Preview {
    ProductItemView(product: sampleProduct)
        .previewLayout(.fixed(width: 200, height: 200))
        .padding()
        .background(colorBackground)
}
