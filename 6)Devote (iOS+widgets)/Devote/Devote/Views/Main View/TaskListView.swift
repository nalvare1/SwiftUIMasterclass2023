//
//  TaskListView.swift
//  Devote
//
//  Created by Natalie Alvarez on 6/7/23.
//

import SwiftUI

struct TaskListView: View {
    // MARK: Fetching Data:
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>

    // MARK: Functions:
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    // MARK: Body:
    var body: some View {
        List {
            ForEach(items) { item in
                TaskListRowView(item: item)
            }
            .onDelete(perform: deleteItems)
        }
        .listStyle(InsetGroupedListStyle()) // this list style has a grey background associated with it (the "scrollContentBackground")
        .scrollContentBackground(.hidden) // fixes transparent background issue (iOS16+)!
        .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.3), radius: 12)
        .padding(.vertical, 0)
        .frame(maxWidth: 640)
    }
}

#Preview {
    TaskListView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
