//
//  NavigationBarDetailView.swift
//  Touchdown
//
//  Created by Natalie Alvarez on 5/31/23.
//

import SwiftUI

struct NavigationBarDetailView: View {
    @EnvironmentObject var shop: Shop

    var body: some View {
        HStack {
            Button(action: {
                withAnimation(.easeIn) {
                    haptics.impactOccurred()
                    shop.selectedProduct = nil
                    shop.showingProduct = false
                }
            }, label: {
                Image(systemName: "chevron.left")
                    .font(.title)
                    .foregroundColor(.white)
            })

            Spacer()

            Button(action: {}, label: {
                Image(systemName: "cart")
                    .font(.title)
                    .foregroundColor(.white)
            })
        }
    }
}

#Preview {
    NavigationBarDetailView()
        .previewLayout(.sizeThatFits)
        .padding()
        .background(Color.gray)
        .environmentObject(Shop())
}
