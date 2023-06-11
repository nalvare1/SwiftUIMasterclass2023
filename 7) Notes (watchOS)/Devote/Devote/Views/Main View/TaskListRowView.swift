//
//  TaskListRowView.swift
//  Devote
//
//  Created by Natalie Alvarez on 6/8/23.
//

import SwiftUI

struct TaskListRowView: View {
    @Environment(\.managedObjectContext) var viewContext
    @ObservedObject var item: Item

    var body: some View {
        Toggle(isOn: $item.completion) {
            Text(item.task ?? "")
                .font(.system(.title2, design: .rounded))
                .fontWeight(.heavy)
                .foregroundColor(item.completion ? Color.pink : Color.primary)
                .padding(.vertical, 12)
                .animation(.default)
        }
        .toggleStyle(CheckboxStyle())
        .onReceive(item.objectWillChange, perform: { _ in // "item.objectWillChange" is a publisher. it will perform the given action (the code inside the if conditional), whenever "item" changes?
            if self.viewContext.hasChanges {
                try? self.viewContext.save()
            }
        })
    }
}
