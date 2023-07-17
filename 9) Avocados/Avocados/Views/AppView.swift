//
//  AppView.swift
//  Avocados
//
//  Created by Natalie Alvarez on 7/7/23.
//

import SwiftUI

struct AppView: View {
    var body: some View {
        TabView {
            AvocadosView()
                .tabItem {
                    Image("tabicon-branch")
                    Text("Avocados")
                }

            RecipesView()
                .tabItem {
                    Image("tabicon-book")
                    Text("Recipes")
                }

            RipeningView()
                .tabItem {
                    Image("tabicon-avocado")
                    Text("Ripening")
                }

            SettingsView()
                .tabItem {
                    Image("tabicon-settings")
                    Text("Settings")
                }

        }
        .edgesIgnoringSafeArea(.top)
        .accentColor(Color.primary)
    }
}

#Preview {
    AppView()
}
