//
//  CardButtonView.swift
//  LearnByDoing
//
//  Created by Natalie Alvarez on 6/19/23.
//

import SwiftUI

struct CardButtonView: View {
    var card: Card
    @Binding var showAlert: Bool

    var body: some View {
        Button(action: {
            playSound(sound: "sound-chime", type: "mp3")
            haptics.impactOccurred()
            showAlert.toggle()
        }) {
            HStack {
                Text(card.callToAction.uppercased())
                    .fontWeight(.heavy)
                    .foregroundColor(Color.white)
                .accentColor(Color.white)

                Image(systemName: "arrow.right.circle")
                    .font(Font.title.weight(.medium))
                    .accentColor(Color.white)
            }
            .padding(.vertical)
            .padding(.horizontal, 24)
            .background(LinearGradient(gradient: Gradient(colors: card.gradientColors), startPoint: .leading, endPoint: .trailing))
            .clipShape(Capsule())
            .shadow(color: Color("ColorShadow"), radius: 6, x: 0, y: 3)
        }
    }
}

#Preview {
    CardButtonView(card: cardData[0], showAlert: .constant(false))
}
