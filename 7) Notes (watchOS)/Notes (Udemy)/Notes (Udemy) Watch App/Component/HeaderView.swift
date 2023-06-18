//
//  HeaderView.swift
//  Notes (Udemy) Watch App
//
//  Created by Natalie Alvarez on 6/18/23.
//

import SwiftUI

struct HeaderView: View {
    var title: String = ""

    var body: some View {
        if title != "" {
            Text(title.uppercased())
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(.accentColor)
        }

        HStack {
            Capsule()
                .frame(height: 1)

            Image(systemName: "note.text")

            Capsule()
                .frame(height: 1)
        }
        .foregroundColor(.accentColor)
    }
}

#Preview {
    HeaderView()
}

#Preview {
    HeaderView(title: "Credits")
}

