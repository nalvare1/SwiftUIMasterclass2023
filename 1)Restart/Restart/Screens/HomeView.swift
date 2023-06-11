//
//  HomeView.swift
//  Restart
//
//  Created by Natalie Alvarez on 5/12/23.
//

import SwiftUI

struct HomeView: View {
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = false
    @State private var isAnimating: Bool = false

    var body: some View {
        VStack(spacing: 20) {
            // MARK: HEADER:
            Spacer()

            ZStack {
                CircleGroupView(ShapeColor: .gray, ShapeOpacity: 0.1)

                Image("character-2")
                    .resizable()
                    .scaledToFit()
                    .padding()
                    .offset(y: isAnimating ? 35 : -35)
                    .animation(
                        Animation
                            .easeInOut(duration: 4)
                            .repeatForever()
                        ,   value: isAnimating
                    )
            }

            // MARK: CENTER:
            Text("The time that leads to mastery is dependent on the intensity of our focus.")
                .font(.title3)
                .fontWeight(.light)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding()

            // MARK: FOOTER:
            Spacer()

            Button(action: {
                playSound(sound: "success", type: "m4a")
                isOnboardingViewActive = true
            }) { // SwiftUI automatically puts 2 or more UI elements within a button into an HStack:
                Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                    .imageScale(.large)

                Text("Restart")
                    .font(.system(.title3, design: .rounded))
                    .fontWeight(.bold)
            }
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
            .controlSize(.large)
        }
        .onAppear(perform: {
            // DispatchQueue = an object that manages the execution of tasks serially or concurrently on ypur app's main thread or on a background thread
            // DispatchQueue.main = executes activity on the system's main thread
            // asyncAfter = executes tasks asynchronously
            // .now() + 3 = run this 3s delayed from now
            DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
                isAnimating = true
            })
        })
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
