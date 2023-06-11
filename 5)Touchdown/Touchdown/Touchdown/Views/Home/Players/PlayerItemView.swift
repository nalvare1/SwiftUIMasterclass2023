//
//  PlayerItemView.swift
//  Touchdown
//
//  Created by Natalie Alvarez on 5/30/23.
//

import SwiftUI

struct PlayerItemView: View {
    let player: Player

    var body: some View {
        Image(player.image)
            .resizable()
            .scaledToFit()
            .cornerRadius(12)
    }
}

#Preview {
    PlayerItemView(player: players[0])
        .previewLayout(.sizeThatFits)
        .padding()
        .background(colorBackground)
}
