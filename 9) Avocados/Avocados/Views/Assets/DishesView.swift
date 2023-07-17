//
//  DishesView.swift
//  Avocados
//
//  Created by Natalie Alvarez on 7/7/23.
//

import SwiftUI

struct DishesView: View {

    var body: some View {
        HStack() {
            VStack {
                ForEach(Array(0..<leftAvocadoIcons.count), id: \.self) {  i in
                    let avocadoIcon = leftAvocadoIcons[i]

                    HStack() {
                        Image(avocadoIcon.imageName)
                            .resizable()
                            .modifier(IconModifier())
                        Spacer()
                        Text(avocadoIcon.title)
                    }

                    if (i < leftAvocadoIcons.count - 1) {
                        Divider()
                    }
                }
            }

            VStack {
                HStack {
                    Divider()
                }

                Image(systemName: "heart.circle")
                    .font(Font.title.weight(.ultraLight))
                    .imageScale(.large)

                HStack {
                    Divider()
                }
            }

            VStack {
                ForEach(Array(0..<rightAvocadoIcons.count), id: \.self) {  i in
                    let avocadoIcon = rightAvocadoIcons[i]

                    HStack() {
                        Text(avocadoIcon.title)
                        Spacer()
                        Image(avocadoIcon.imageName)
                            .resizable()
                            .modifier(IconModifier())

                    }

                    if (i < rightAvocadoIcons.count - 1) {
                        Divider()
                    }
                }
            }

        }
        .font(.system(.callout, design: .serif))
        .foregroundColor(Color.gray)
        .padding(.horizontal)
        .frame(maxHeight: 220)
    }
}

struct IconModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 42, height: 42, alignment: .center)
    }
}

#Preview {
    DishesView()
        .previewLayout(.fixed(width: 414, height: 280))
}
