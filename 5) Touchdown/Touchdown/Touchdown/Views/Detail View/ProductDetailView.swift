//
//  ProductDetailView.swift
//  Touchdown
//
//  Created by Natalie Alvarez on 5/31/23.
//

import SwiftUI

struct ProductDetailView: View {
    @EnvironmentObject var shop: Shop

    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            // Navbar:
            NavigationBarDetailView()
                .padding(.horizontal)
                .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)

            // Header:
            HeaderDetailView()
                .padding(.horizontal)

            // Top Part:
            TopPartDetailView()
                .padding(.horizontal)
                .zIndex(1) // this will move this UI above others

            // Bottom Part:
            BottomPartDetailView()
        }
        .zIndex(0)
        .ignoresSafeArea(.all, edges: .all)
        .background(
            Color(shop.selectedProduct?.formattedColor ?? sampleProduct.formattedColor)
        ).ignoresSafeArea(.all, edges: .all)
    }
}

#Preview {
    ProductDetailView()
        .previewLayout(.fixed(width: 375, height: 812))
        .environmentObject(Shop())
}
