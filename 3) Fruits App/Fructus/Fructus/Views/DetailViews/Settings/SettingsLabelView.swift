//
//  SettingsLabelView.swift
//  Fructus
//
//  Created by Natalie Alvarez on 5/20/23.
//

import SwiftUI

struct SettingsLabelView: View {
    var labelText: String
    var labelImageName: String

    var body: some View {
        HStack {
            Text(labelText.uppercased()).fontWeight(.bold)
            Spacer()
            Image(systemName: labelImageName)
        }
    }
}

struct SettingsLabelView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsLabelView(labelText: "Fructus", labelImageName: "info.circle")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
