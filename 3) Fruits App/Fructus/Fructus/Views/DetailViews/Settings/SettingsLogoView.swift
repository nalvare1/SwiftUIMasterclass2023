//
//  SettingsLogoView.swift
//  Fructus
//
//  Created by Natalie Alvarez on 5/20/23.
//

import SwiftUI

struct SettingsLogoView: View {
    var body: some View {
        GroupBox(
            label:
                SettingsLabelView(labelText: "Fructus", labelImageName: "info.circle")
        ) {
            Divider().padding(.vertical, 4)

            HStack(alignment: .center, spacing: 10) {
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80)
                    .cornerRadius(9)

                Text("Most fruits are naturally low in fat, sodium, and calories. None have cholesterol. Fruits are sources of many essential nutrients including potassium, dietary fiber, vitamins, and much more.")
                    .font(.footnote)
            }
        }
    }
}

struct SettingsLogoView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsLogoView()
    }
}
