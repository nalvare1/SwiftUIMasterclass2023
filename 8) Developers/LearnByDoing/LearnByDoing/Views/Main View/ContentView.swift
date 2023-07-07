//
//  ContentView.swift
//  LearnByDoing
//
//  Created by Natalie Alvarez on 6/19/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .center, spacing: 20) {
                ForEach(cardData) { card in
                    CardView(card: card)
                }
            }
            .padding(20)
        }
    }
}

#Preview {
    ContentView()
}
