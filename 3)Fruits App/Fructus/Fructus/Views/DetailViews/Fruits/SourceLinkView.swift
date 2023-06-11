//
//  SourceLinkView.swift
//  Fructus
//
//  Created by Natalie Alvarez on 5/20/23.
//

import SwiftUI

struct SourceLinkView: View {
    var body: some View {
        GroupBox() { // a GroupBox behaves like a VStack!
            HStack {
                Text("Content source")
                Spacer()
                Link("Wikipedia", destination: URL(string: "https://wikipedia.com")!)
                Image(systemName: "arrow.up.right.square")
            }
            .font(.footnote)
        }
    }
}

struct SourceLinkView_Previews: PreviewProvider {
    static var previews: some View {
        SourceLinkView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
