//
//  TouchdownApp.swift
//  Touchdown
//
//  Created by Natalie Alvarez on 5/30/23.
//

import SwiftUI

@main
struct TouchdownApp: App {
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(Shop()) // Allows us to create views that rely on shared data. So now, we can access the properties of this Shop class anywhere
        }
    }
}
