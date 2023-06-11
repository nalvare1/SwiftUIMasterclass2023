//
//  HeaderDetailView.swift
//  Touchdown
//
//  Created by Natalie Alvarez on 5/31/23.
//

import SwiftUI

struct HeaderDetailView: View {
    @EnvironmentObject var shop: Shop

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("Protective Gear")

            Text(shop.selectedProduct?.name ?? sampleProduct.name)
                .font(.largeTitle)
                .fontWeight(.black)
        }
        .foregroundColor(.white)
    }
}

#Preview {
    HeaderDetailView()
        .previewLayout(.sizeThatFits)
        .padding()
        .background(Color.gray)
}
