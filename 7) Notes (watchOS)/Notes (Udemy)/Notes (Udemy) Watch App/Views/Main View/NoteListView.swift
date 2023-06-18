//
//  NoteListView.swift
//  Notes (Udemy) Watch App
//
//  Created by Natalie Alvarez on 6/11/23.
//

import SwiftUI

struct NoteListView: View {
    @AppStorage("lineCount") var lineCount: Int = 1
    @Binding var notes: [Note]

    var body: some View {
        VStack {
            if notes.count >= 1 {
                List {
                    ForEach(0..<notes.count, id: \.self) { i in
                        let note = notes[i]

                        NavigationLink(destination: NoteDetailView(note: note, count: notes.count, index: i)) {
                            HStack {
                                Capsule()
                                    .frame(width: 4)
                                    .foregroundColor(.accentColor)

                                Text(note.text)
                                    .lineLimit(lineCount)
                                    .padding(.leading, 5)
                            }
                        }
                    }
                    .onDelete { indexSet in
                        Note.deleteNote(atOffsets: indexSet, from: &notes)
                    }
                }
            } else {
                Spacer()

                Image(systemName: "note.text")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.gray)
                    .opacity(0.25)
                    .padding(5)

                Spacer()
            }
        }
    }
}

#Preview {
    NoteListView(notes: .constant(sampleNotes))
}
