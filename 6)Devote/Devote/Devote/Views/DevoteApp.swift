//
//  DevoteApp.swift
//  Devote
//
//  Created by Natalie Alvarez on 6/2/23.
//

import SwiftUI

@main
struct DevoteApp: App {
    let persistenceController = PersistenceController.shared
    @AppStorage("isDarkMode") var isDarkMode: Bool = false

    var body: some Scene {
        WindowGroup {
            MainView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext) // managedObjectContext = stores our active Core Data managed object context; now this can be used by MainView() and all child views
                .preferredColorScheme(isDarkMode ? .dark : .light)
        }
    }
}
