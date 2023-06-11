//
//  MotionAnimationView.swift
//  Africa
//
//  Created by Natalie Alvarez on 5/25/23.
//

import SwiftUI

struct MotionAnimationView: View {
    @State private var randomCircle = Int.random(in: 12...16)
    @State private var isAnimating = false

    // MARK: - FUNCTIONS:
    func randomCoordinate(max: CGFloat) -> CGFloat {
        return CGFloat.random(in: 0...max) // generate a random # between 0 and max
    }

    func randomSize() -> CGFloat {
        return CGFloat(Int.random(in: 10...300))
    }

    func randomScale() -> CGFloat {
        return CGFloat(Double.random(in: 0.1...2.0))
    }

    func randomSpeed() -> Double {
        return Double.random(in: 0.025...1.0)
    }

    func randomDelay() -> Double {
        return Double.random(in: 0...2.0)
    }

    // MARK: - Body:
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach(0...randomCircle, id: \.self) { item in
                    Circle()
                        .foregroundColor(.gray)
                        .opacity(0.15)
                        .frame(width: randomSize(), height: randomSize(), alignment: .center)
                        .scaleEffect(isAnimating ? randomScale() : 1)
                        .position(
                            x: randomCoordinate(max: geometry.size.width),
                            y: randomCoordinate(max: geometry.size.height)
                        )
                        .animation(
                            Animation.interpolatingSpring(stiffness: 0.5, damping: 0.5)
                                .repeatForever()
                                .speed(2)
                                .delay(randomDelay()),
                            value: isAnimating
                        )
                        .onAppear(perform: {
                            isAnimating = true
                        })
                }
            }
            .drawingGroup()
        }
    }
}

struct MotionAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        MotionAnimationView()
    }
}
