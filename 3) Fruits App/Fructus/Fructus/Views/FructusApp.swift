//
//  FructusApp.swift
//  Fructus
//
//  Created by Natalie Alvarez on 5/17/23.
//

import SwiftUI

@main
struct FructusApp: App {
    @AppStorage("isOnboarding") var isOnboarding: Bool = true
    @Environment(\.scenePhase) private var scenePhase

    var body: some Scene {
        WindowGroup {
            if isOnboarding {
                OnboardingView()
                    .onAppear {
                        debugPrint("isOnboarding = true")
                    }
            } else {
                FruitContentView()
                    .onAppear {
                        debugPrint("isOnboarding = false")
                    }
            }
        }
        .onChange(of: scenePhase) { newScenePhase in // if app becomes active, set isOnboarding = true again
            if newScenePhase == .active {
                isOnboarding = true
            }
        }
    }
}
