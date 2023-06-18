//
//  SettingsView.swift
//  Notes (Udemy) Watch App
//
//  Created by Natalie Alvarez on 6/18/23.
//

import SwiftUI

struct SettingsView: View {
    @AppStorage("lineCount") var lineCount: Int = 1
    @State private var sliderValue: Float = 1.0

    func updateLineCount() {
        lineCount = Int(sliderValue)
    }

    var body: some View {
        VStack(spacing: 8) {
            HeaderView(title: "Settings")
            
            Text("Lines: \(lineCount)".uppercased())
                .fontWeight(.bold)

            Slider(value: Binding(get: {
                self.sliderValue
            }, set: {(newSliderValue) in
                if newSliderValue >= 1 {
                    self.sliderValue = newSliderValue
                    self.updateLineCount()
                }
            }), in: 0...4, step: 1)
                .accentColor(.accentColor)
                .onAppear {
                    sliderValue = Float(lineCount)
                }
        }
    }
}

#Preview {
    SettingsView()
}
