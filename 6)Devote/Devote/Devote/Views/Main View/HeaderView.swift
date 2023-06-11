//
//  HeaderView.swift
//  Devote
//
//  Created by Natalie Alvarez on 6/7/23.
//

import SwiftUI

struct HeaderView: View {
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false

    var body: some View {
        HStack(spacing: 10) {
            Text("Devote")
                .font(.system(.largeTitle))
                .fontWeight(.heavy)
                .padding(.leading, 4)

            Spacer()

            EditButton()
                .font(.system(size: 16, weight: .semibold, design: .rounded))
                .padding(.horizontal, 10)
                .frame(minWidth: 70, maxHeight: 24)
                .background(
                    Capsule().stroke(Color.white, lineWidth: 2)
                )

            Button(action: {
                isDarkMode.toggle()
                playSound(sound: "sound-tap", type: "mp3")
                haptics.notificationOccurred(.success)
            }, label: {
                Image(systemName: isDarkMode ? "moon.circle.fill" : "moon.circle")
                    .resizable()
                    .frame(width: 24, height: 24)
                    .font(.system(.title, design: .rounded))
            })
        }
        .padding()
        .foregroundColor(.white)
    }
}

#Preview {
    HeaderView()
        .preferredColorScheme(.dark)
}
