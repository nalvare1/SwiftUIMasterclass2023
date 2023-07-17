//
//  RecipesView.swift
//  Avocados
//
//  Created by Natalie Alvarez on 7/7/23.
//

import SwiftUI

struct RecipesView: View {
    var headers: [Header] = headersData

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 20) {
                // MARK: Header:
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(alignment: .top, spacing: 0) {
                        ForEach(headers) { header in
                            HeaderView(header: header)
                        }
                    }
                }

                // MARK: Footer:
                VStack(alignment: .center, spacing: 20) {
                    Text("All About Avocados")
                        .font(.system(.title, design: .serif))
                        .fontWeight(.bold)
                        .foregroundColor(Color("ColorGreenAdaptive"))
                        .padding(8)

                    Text("Everything you wanted to know about avocados, but were too afraid to ask.")
                        .font(.system(.body, design: .serif))
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color.gray)
                }
                .frame(maxWidth: 640)
                .padding()
                .padding(.bottom, 45)
            }
        }
        .edgesIgnoringSafeArea(.all)
        .padding(0)
    }
}

#Preview {
    RecipesView(headers: headersData)
}
