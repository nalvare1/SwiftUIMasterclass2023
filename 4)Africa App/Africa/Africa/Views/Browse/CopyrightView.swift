//
//  CopyrightView.swift
//  Africa
//
//  Created by Natalie Alvarez on 5/25/23.
//

import SwiftUI

struct CopyrightView: View {
    var body: some View {
        VStack {
            Image("compass")
                .resizable()
                .scaledToFit()
                .frame(width: 128, height: 128)

            Text("""
    Copyright © Natalie Alvarez
    All rights reserved
    Better Apps ♡ Less Code
    """)
            .font(.footnote)
        .multilineTextAlignment(.center)
        }
        .padding()
        .opacity(0.4)
    }
}

struct CreditsView_Previews: PreviewProvider {
    static var previews: some View {
        CopyrightView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
