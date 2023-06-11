//
//  CategoriesView.swift
//  Touchdown
//
//  Created by Natalie Alvarez on 5/30/23.
//

import SwiftUI

struct CategoriesView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false, content: {
            LazyHGrid(rows: gridLayout, alignment: .center, spacing: columnSpacing, pinnedViews: [], content: {
                Section(
                    header: CategorySectionView(rotateClockwise: false),
                    footer: CategorySectionView(rotateClockwise: true)
                ) {
                    ForEach(categories) { category in
                        CategoryItemView(category: category)
                    }
                }
            })
            .frame(height: 140)
            .padding(.horizontal, 15)
            .padding(.vertical, 10)
        })
    }
}

#Preview {
    CategoriesView()
        .previewLayout(.sizeThatFits)
        .padding()
        .background(colorBackground)
}
