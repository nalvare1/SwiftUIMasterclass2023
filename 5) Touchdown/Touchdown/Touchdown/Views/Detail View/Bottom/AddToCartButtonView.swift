//
//  AddToCartButtonView.swift
//  Touchdown
//
//  Created by Natalie Alvarez on 5/31/23.
//

import SwiftUI

struct AddToCartButtonView: View {
    @EnvironmentObject var shop: Shop

    var body: some View {
        Button(action: {
            haptics.impactOccurred()
        }, label: {
            Spacer()
            Text("Add to cart".uppercased())
                .font(.system(.title2, design: .rounded))
                .fontWeight(.bold)
                .foregroundColor(.white)
            Spacer()
        })
        .padding(15)
        .background(
            Color(shop.selectedProduct?.formattedColor ?? sampleProduct.formattedColor)
        )
        .clipShape(Capsule())
    }
}

#Preview {
    AddToCartButtonView()
        .environmentObject(Shop())
}
