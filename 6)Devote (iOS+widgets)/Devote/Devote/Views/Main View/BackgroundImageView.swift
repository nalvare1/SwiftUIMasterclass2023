//
//  BackgroundImageView.swift
//  Devote
//
//  Created by Natalie Alvarez on 6/7/23.
//

import SwiftUI

struct BackgroundImageView: View {
    var body: some View {
        Image("rocket")
            .antialiased(true)
            .resizable()
            .scaledToFit()
            .ignoresSafeArea(.all)
    }
}

#Preview {
    BackgroundImageView()
}
