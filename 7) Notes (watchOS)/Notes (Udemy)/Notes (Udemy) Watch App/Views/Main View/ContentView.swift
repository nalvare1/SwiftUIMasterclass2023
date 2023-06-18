//
//  ContentView.swift
//  Notes (Udemy) Watch App
//
//  Created by Natalie Alvarez on 6/11/23.
//

import SwiftUI

struct ContentView: View {
    @State private var notes: [Note] = [Note]() // initialize notes as an empty array of Notes
    @State private var text: String = ""

    var body: some View {
        NavigationStack {
            VStack {
                HStack(alignment: .center, spacing: 6) {
                    TextField("Add New Note", text: $text)

                    Button {
                        Note.addNote(text: &text, to: &notes)
                    } label: {
                        Image(systemName: "plus.circle")
                            .font(.system(size: 42, weight: .semibold))
                    }
                    .fixedSize()
                    .buttonStyle(PlainButtonStyle())
                    .foregroundColor(.accentColor)
                }

                Spacer()

                NoteListView(notes: $notes)
            }
            .navigationTitle("Notes")
            .onAppear(perform: {
                Note.getNotes { loadedNotes in
                    notes = loadedNotes
                }
            })
        }
    }
}

#Preview {
    ContentView()
}
