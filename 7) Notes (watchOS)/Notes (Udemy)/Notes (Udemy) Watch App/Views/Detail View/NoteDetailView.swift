//
//  NoteDetailView.swift
//  Notes (Udemy) Watch App
//
//  Created by Natalie Alvarez on 6/18/23.
//

import SwiftUI

struct NoteDetailView: View {
    let note: Note
    let count: Int
    let index: Int

    @State private var isCreditsViewPresented: Bool = false
    @State private var isSettingsViewPresented: Bool = false

    var body: some View {
        VStack(alignment: .center, spacing: 3) {
            // HEADER:
            HeaderView()

            // CONTENT:
            Spacer()

            ScrollView(.vertical) {
                Text(note.text)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
            }

            Spacer()

            // FOOTER:
            HStack(alignment: .center) {
                Image(systemName: "gear")
                    .imageScale(.large)
                    .onTapGesture {
                        isSettingsViewPresented.toggle()
                    }
                    // This code generates a SwiftUI sheet on Apple Watch (and automatically generates a Cancel/"X" button in the status bar):
                    .sheet(isPresented: $isSettingsViewPresented, content: {
                        SettingsView()
                    })

                Spacer()

                Text("\(index+1) / \(count)")

                Spacer()

                Image(systemName: "info.circle")
                    .imageScale(.large)
                    .onTapGesture {
                        isCreditsViewPresented.toggle()
                    }
                    .sheet(isPresented: $isCreditsViewPresented, content: {
                        CreditsView()
                    })
            }
            .foregroundColor(.secondary)

        }
        .padding(3)
    }
}

#Preview {
    NoteDetailView(note: sampleNote, count: 5, index: 0)
}
