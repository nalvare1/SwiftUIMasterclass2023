//
//  CardView.swift
//  LearnByDoing
//
//  Created by Natalie Alvarez on 6/19/23.
//

import SwiftUI

struct CardView: View {
    var card: Card

    // Animations:
    @State private var isFadingIn: Bool = false
    @State private var isMovingDown: Bool = false
    @State private var isMovingUp: Bool = false

    // Alerts:
    @State private var showAlert: Bool = false

    var body: some View {
        ZStack {
            Image(card.imageName)
                .opacity(isFadingIn ? 1.0 : 0.0)
                .zIndex(1)

            VStack {
                Text(card.title)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)

                Text(card.headline)
                    .fontWeight(.light)
                    .foregroundColor(Color.white)
                    .italic()
            }
            .offset(y: isMovingDown ? -218 : -300)
            .zIndex(2)

            CardButtonView(card: card, showAlert: $showAlert)
                .offset(y: isMovingUp ? 210 : 300)
                .zIndex(3)

        }
        .frame(width: 355, height: 545)
        .background(LinearGradient(gradient: Gradient(colors: card.gradientColors), startPoint: .top, endPoint: .bottom))
        .cornerRadius(16)
        .shadow(radius: 8)
        .onAppear() {
            withAnimation(.linear(duration: 1.2)) {
                self.isFadingIn.toggle()
            }
            withAnimation(.linear(duration: 0.8)) {
                self.isMovingDown.toggle()
            }
            withAnimation(.linear(duration: 0.8)) {
                self.isMovingUp.toggle()
            }
        }
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text(card.title),
                message: Text(card.message),
                dismissButton: .default(Text("OK"))
            )
        }
    }
}

#Preview {
    CardView(card: cardData[0])
        .previewLayout(.sizeThatFits)
}
