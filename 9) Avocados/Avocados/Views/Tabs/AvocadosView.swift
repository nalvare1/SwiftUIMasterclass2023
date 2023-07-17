//
//  AvocadosView.swift
//  Avocados
//
//  Created by Natalie Alvarez on 7/7/23.
//

import SwiftUI

struct AvocadosView: View {
    @State private var isAnimating: Bool = false

    var body: some View {
        VStack {
            Spacer()

            Image("avocado")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 240, height: 240, alignment: .center)
                .shadow(color: Color("ColorBlackTransparentDark"), radius: 12, x: 0, y: 8)
                .scaleEffect(isAnimating ? 1 : 0.9)
                .opacity(isAnimating ? 1 : 0.9)
                .animation(Animation.easeInOut(duration: 1.5).repeatForever(autoreverses: true))

            VStack {
                Text("Avocados".uppercased())
                    .font(.system(size: 42, weight: .bold, design: .serif))
                    .foregroundColor(Color.white)
                    .padding()
                .shadow(color: Color("ColorBlackTransparentDark"), radius: 4, x: 0, y: 4)

                Text("""
Creamy, green, and full of nutrients! Avocado is a powerhouse ingredient at any meal. Enjoy these handpicked avocado recipes for breakfast, lunch, dinner & more!
""")
                .lineLimit(nil)
                .font(.system(.headline, design: .serif))
                .foregroundColor(Color("ColorGreenLight"))
                .multilineTextAlignment(.center)
                .lineSpacing(8)
                .frame(maxWidth: 640, minHeight: 120)
            }
            .padding()


            Spacer()
        }
        .background(
            Image("background")
                .resizable()
                .aspectRatio(contentMode: .fill)
        )
        .edgesIgnoringSafeArea(.all)
        .onAppear(perform: {
            isAnimating.toggle()
        })
    }
}

#Preview {
    AvocadosView()
        //.environment(\.colorScheme, .dark)
        //.preferredColorScheme(.dark)
}
