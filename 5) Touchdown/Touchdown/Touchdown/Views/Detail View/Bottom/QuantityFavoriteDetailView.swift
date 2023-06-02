//
//  QuantityFavoriteDetailView.swift
//  Touchdown
//
//  Created by Natalie Alvarez on 5/31/23.
//

import SwiftUI

struct QuantityFavoriteDetailView: View {
    @State private var counter: Int = 0

    var body: some View {
        HStack(alignment: .center, spacing: 6, content: {
            Button(action: {
                if counter > 0 {
                    haptics.impactOccurred()
                    counter -= 1
                }
            }, label: {
                Image(systemName: "minus.circle")
            })

            Text("\(counter)")
                .fontWeight(.semibold)
                .frame(minWidth: 36)

            Button(action: {
                if counter < 100 {
                    haptics.impactOccurred()
                    counter += 1
                }
            }, label: {
                Image(systemName: "plus.circle")
            })

            Spacer()

            Button(action: {
                haptics.impactOccurred()
            }, label: {
                Image(systemName: "heart.circle")
                    .foregroundColor(.pink)
            })
        })
        .font(.system(.title, design: .rounded))
        .foregroundColor(.black)
        .imageScale(.large)
    }
}

#Preview {
    QuantityFavoriteDetailView()
        .previewLayout(.sizeThatFits)
        .padding()
}
