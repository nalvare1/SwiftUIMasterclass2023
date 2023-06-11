//
//  CircularAnimalView.swift
//  Africa
//
//  Created by Natalie Alvarez on 5/25/23.
//

import SwiftUI

struct CircularAnimalView: View {
    let image: String

    var body: some View {
        Image(image)
            .resizable()
            .scaledToFit()
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 1))
    }
}

struct CircularAnimalView_Previews: PreviewProvider {
    static var previews: some View {
        CircularAnimalView(image: "lion")
    }
}
