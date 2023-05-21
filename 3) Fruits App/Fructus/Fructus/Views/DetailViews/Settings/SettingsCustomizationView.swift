//
//  SettingsCustomizationView.swift
//  Fructus
//
//  Created by Natalie Alvarez on 5/20/23.
//

import SwiftUI

struct SettingsCustomizationView: View {
    @AppStorage("isOnboarding") var isOnboarding: Bool = false

    var body: some View {
        GroupBox(
            label:
                SettingsLabelView(labelText: "Customization", labelImageName: "paintbrush")
        ) {
            Divider().padding(.vertical, 4)

            Text("If you wish, you can restart the application by toggling the switch below. That way, it restarts the onboarding process and you will see the welcome screen again.")
                .padding(.vertical, 8)
                .frame(minHeight: 60)
                .layoutPriority(1)
                .font(.footnote)
                .multilineTextAlignment(.leading)

            Toggle(isOn: $isOnboarding) {
                if isOnboarding {
                    Text("Restarted".uppercased())
                        .fontWeight(.bold)
                        .foregroundColor(Color.green)
                } else {
                    Text("Restart".uppercased())
                        .fontWeight(.bold)
                        .foregroundColor(Color.secondary)
                }
            }
            .padding()
            .background(
                Color(UIColor.tertiarySystemBackground)
                    .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
            )
        }
    }
}

struct SettingsCustomizationView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsCustomizationView()
    }
}
