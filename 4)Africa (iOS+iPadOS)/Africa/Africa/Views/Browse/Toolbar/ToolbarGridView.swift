//
//  ToolbarGridView.swift
//  Africa
//
//  Created by Natalie Alvarez on 5/25/23.
//

import SwiftUI

struct ToolbarGridView: View {
    let animals: [Animal]
    var gridLayout: [GridItem]

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                ForEach(animals) { animal in
                    NavigationLink(destination: AnimalDetailView(animal: animal)) {
                        Image(animal.image)
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(12)
                    }
                }
            }
            .padding(10)
            .animation(.easeIn)
        }
    }
}

struct ToolbarGridView_Previews: PreviewProvider {
    static let animals: [Animal] = Bundle.main.decode("animals.json")

    static var previews: some View {
        ToolbarGridView(animals: animals, gridLayout: [GridItem(.flexible())])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
