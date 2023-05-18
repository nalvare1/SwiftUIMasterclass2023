//
//  MagazineCoverView.swift
//  Pinch
//
//  Created by Natalie Alvarez on 5/17/23.
//

import SwiftUI

struct MagazineCoverView: View {
    var imageName: String
    var isAnimating: Bool
    var imageScale: CGFloat
    var imageOffset: CGSize

    var body: some View {
        Image(imageName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .cornerRadius(10)
            .padding()
            .shadow(color: .black.opacity(0.2), radius: 12, x: 2, y: 2)
            .opacity(isAnimating ? 1 : 0)
            .animation(.linear(duration: 1), value: isAnimating) // add 1s linear animation to the opacity
            .offset(x: imageOffset.width, y: imageOffset.height)
            .scaleEffect(imageScale)

    }
}

struct MagazineCoverView_Previews: PreviewProvider {
    static var previews: some View {
        MagazineCoverView(imageName: "magazine-front-cover", isAnimating: true, imageScale: 1, imageOffset: .zero)
    }
}
