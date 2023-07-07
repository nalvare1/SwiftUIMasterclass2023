//
//  ToolbarListView.swift
//  Africa
//
//  Created by Natalie Alvarez on 5/25/23.
//

import SwiftUI

struct ToolbarListView: View {
    let animals: [Animal]

    var body: some View {
        List {
            CoverImageView()
                .frame(width: 300, height: 200)
                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))

            ForEach(animals) { animal in
                NavigationLink(destination: AnimalDetailView(animal: animal)) {
                    AnimalListItemView(animal: animal)
                }
            }

            CopyrightView()
                .modifier(CenterModifier())
        }
    }
}

struct ToolbarListView_Previews: PreviewProvider {
    static let animals: [Animal] = Bundle.main.decode("animals.json")

    static var previews: some View {
        NavigationView {
            ToolbarListView(animals: animals)
        }
    }
}
