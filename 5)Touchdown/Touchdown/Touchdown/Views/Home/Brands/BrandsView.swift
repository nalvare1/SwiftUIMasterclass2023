//
//  BrandsView.swift
//  Touchdown
//
//  Created by Natalie Alvarez on 5/30/23.
//

import SwiftUI

struct BrandsView: View {
    var body: some View {
        VStack {
            TitleView(title: "Brands")

            ScrollView(.horizontal, showsIndicators: false, content: {
                LazyHGrid(rows: gridLayout, spacing: 15, content: {
                    ForEach(brands) { brand in
                        BrandItemView(brand: brand)
                    }
                })
                .frame(height: 200)
                .padding(15)
            })
        }
    }
}

#Preview {
    BrandsView()
        .previewLayout(.sizeThatFits)
        .background(colorBackground)
}
