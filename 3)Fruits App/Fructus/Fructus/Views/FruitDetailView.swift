//
//  FruitDetailView.swift
//  Fructus
//
//  Created by Natalie Alvarez on 5/20/23.
//

import SwiftUI

struct FruitDetailView: View {
    var fruit: Fruit

    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .center, spacing: 20) {
                    FruitHeaderView(fruit: fruit)

                    VStack(alignment: .leading, spacing: 20) {
                        Text(fruit.title)
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                            .foregroundColor(fruit.gradientColors[1])

                        Text(fruit.headline)
                            .font(.headline)
                            .multilineTextAlignment(.leading)

                        FruitNutrientsView(fruit: fruit)


                        Text("Learn more about \(fruit.title)".uppercased())
                            .fontWeight(.bold)
                            .foregroundColor(fruit.gradientColors[1])

                        Text(fruit.description)
                            .multilineTextAlignment(.leading)

                        SourceLinkView()
                            .padding(.top, 10)
                            .padding(.bottom, 40)
                    }
                }
                .navigationBarTitle(fruit.title, displayMode: .inline)
                .navigationBarHidden(true)
            }
            .edgesIgnoringSafeArea(.top)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct FruitDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FruitDetailView(fruit: fruitsData[0])
    }
}
