//
//  PlayersView.swift
//  Touchdown
//
//  Created by Natalie Alvarez on 5/30/23.
//

import SwiftUI

struct PlayersView: View {
    var body: some View {
        TabView {
            ForEach(players) { player in
                PlayerItemView(player: player)
                    .padding(.top, 10)
                    .padding(.horizontal, 15)
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
    }
}

#Preview {
    PlayersView()
        .background(Color.gray)
}
