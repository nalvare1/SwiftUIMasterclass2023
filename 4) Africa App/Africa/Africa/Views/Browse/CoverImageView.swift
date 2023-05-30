//
//  CoverImageView.swift
//  Africa
//
//  Created by Natalie Alvarez on 5/24/23.
//

import SwiftUI

struct CoverImageView: View {
    let coverImages: [CoverImage] = Bundle.main.decode("covers.json")

    var body: some View {
        TabView {
            ForEach(coverImages) { coverImage in
                Image(coverImage.name)
                    .resizable()
                    .scaledToFill()
            }
        }
        .tabViewStyle(PageTabViewStyle())
    }
}

struct CoverImageView_Previews: PreviewProvider {
    static var previews: some View {
        CoverImageView()
            .previewLayout(.fixed(width: 400, height: 300))
    }
}
