//
//  Note.swift
//  Notes (Udemy) Watch App
//
//  Created by Natalie Alvarez on 6/11/23.
//

import Foundation
import SwiftUI

struct Note: Identifiable, Codable {
    let id: UUID
    let text: String
}

// CRUD operations:
extension Note {
    static func getDocumentDirectory() -> URL {
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return path[0]
    }

    static func printNotes(_ notes: [Note]) {
        dump(notes)
    }

    static func getNotes(completion: @escaping ([Note]) -> Void) {
        DispatchQueue.main.async {
            do {
                let url = getDocumentDirectory().appendingPathComponent("notes")
                let data = try Data(contentsOf: url)
                let notes = try JSONDecoder().decode([Note].self, from: data)
                completion(notes) // when the async task finishes, we call this completion
            } catch {
                completion([])
            }
        }
    }

    static func updateNotes(_ notes: [Note]) {
        do {
            let data = try JSONEncoder().encode(notes)
            let url = getDocumentDirectory().appendingPathComponent("notes")
            try data.write(to: url)
        } catch {
            print("updateNotes(): Failed to save data")
        }
    }

    static func addNote(text: inout String, to notes: inout [Note]) {
        // 1. Only run the action, IF the TextField is NOT empty:
        guard !text.isEmpty else { return }

        // 2. Create a new note item, and initialize it with the text value:
        let note = Note(id: UUID(), text: text)

        // 3. Add the new note item to the Notes array:
        notes.append(note)

        // 4. Make the TextField empty:
        text = ""

        // 5. Save the notes:
        updateNotes(notes)
    }

    static func deleteNote(atOffsets offsets: IndexSet, from notes: inout [Note]) {
       notes.remove(atOffsets: offsets)
       updateNotes(notes)
    }
}
