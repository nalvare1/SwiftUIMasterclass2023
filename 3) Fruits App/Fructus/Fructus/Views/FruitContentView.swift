//
//  FruitContentView.swift
//  Fructus
//
//  Created by Natalie Alvarez on 5/17/23.
//

import SwiftUI

struct FruitContentView: View {
    var fruits: [Fruit] = fruitsData

    @State private var showSettings: Bool = false

    var body: some View {
        NavigationView {
            List {
                ForEach(fruits.shuffled()) { fruit in
                    NavigationLink(destination: FruitDetailView(fruit: fruit)) {
                        FruitRowView(fruit: fruit)
                            .padding(.vertical, 4)
                    }
                }
            }
            .navigationTitle("Fruits")
            .navigationBarItems(
                trailing:
                    Button(action: {
                        showSettings = true
                    }) {
                        Image(systemName: "slider.horizontal.3")
                    }
                    .sheet(isPresented: $showSettings) {
                        SettingsView()
                    }
            )
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct FruitContentView_Previews: PreviewProvider {
    static var previews: some View {
        FruitContentView(fruits: fruitsData)
    }
}
