//
//  CreditsView.swift
//  Notes (Udemy) Watch App
//
//  Created by Natalie Alvarez on 6/18/23.
//

import SwiftUI

struct CreditsView: View {
//    @State private var randomNumber: Int = Int.random(in: 1..<4)
//
//    private var randomImage: String {
//        return "developer-no\(randomNumber)"
//    }

    var body: some View {
        VStack(spacing: 3) {
            Image("developer-no2")
                .resizable()
                .scaledToFit()
                .layoutPriority(1)

            HeaderView(title: "Credits")

            Text("Natalie Alvarez")
                .foregroundColor(.primary)
                .fontWeight(.bold)

            Text("Developer")
                .font(.footnote)
                .foregroundColor(.secondary)
                .fontWeight(.light)

        }
    }
}

#Preview {
    CreditsView()
}
