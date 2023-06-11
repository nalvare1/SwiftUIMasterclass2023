//
//  Persistence.swift
//  Devote
//
//  Created by Natalie Alvarez on 6/2/23.
//

import CoreData

struct PersistenceController {
    // MARK: 1. Persistent Controller:
    static let shared = PersistenceController()

    // MARK: 2. Persistent Container:
    // initializes our Core Data stack, and helps us load our Core Data model later
    let container: NSPersistentContainer

    // MARK: 3. Initialization:
    // load the persistent store
    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "Devote") // path to temporary storage?
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in // load the storage (temporary or persistent)
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        container.viewContext.automaticallyMergesChangesFromParent = true
    }

    // MARK: 4. Preview:
    // Sample data for the Preview
    static var preview: PersistenceController = {
        let result = PersistenceController(inMemory: true) // Switch to in memory store
        let viewContext = result.container.viewContext
        for i in 0..<5 {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()
            newItem.task = "Sample task #\(i)"
            newItem.completion = false
            newItem.id = UUID()
        }
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        return result
    }()
}
