//
//  CheckboxStyle.swift
//  Devote
//
//  Created by Natalie Alvarez on 6/8/23.
//

import SwiftUI

struct CheckboxStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        return HStack {
            // a checkbox bubble:
            Image(systemName: configuration.isOn ? "checkmark.circle.fill" : "circle")
                .foregroundColor(configuration.isOn ? .pink : .primary)
                .font(.system(size: 30, weight: .semibold, design: .rounded))
                .onTapGesture {
                    configuration.isOn.toggle()
                    haptics.notificationOccurred(.success)

                    if configuration.isOn {
                        playSound(sound: "sound-rise", type: "mp3")
                    } else {
                        playSound(sound: "sound-tap", type: "mp3")
                    }
                }

            // the Label of the Toggle:
            configuration.label
        }
    }
}

#Preview {
    Toggle("Placeholder label", isOn: .constant(true))
        .toggleStyle(CheckboxStyle())
        .padding()
        .previewLayout(.sizeThatFits)
}
