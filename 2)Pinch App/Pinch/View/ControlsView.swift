//
//  ControlsView.swift
//  Pinch
//
//  Created by Natalie Alvarez on 5/17/23.
//

import SwiftUI

struct ControlsView: View {
    var isAnimating: Bool
    @Binding var imageScale: CGFloat
    @Binding var imageOffset: CGSize

    // functions:
    var resetImageState: () -> Void

    func scaleDown() {
        return withAnimation(.spring()) {
            if imageScale > 1 {
                imageScale -= 1

                if imageScale <= 1 {
                    resetImageState()
                }
            }
        }
    }

    func scaleUp() {
        return withAnimation(.spring()) {
            if imageScale < 5 {
                imageScale += 1

                if imageScale > 5 {
                    imageScale = 5
                }
            }
        }
    }


    var body: some View {
        Group {
            HStack {
                // Scale Down:
                Button {
                    scaleDown()
                } label: {
                    ControlImageView(icon: "minus.magnifyingglass")
                }

                // Reset:
                Button {
                    resetImageState()
                } label: {
                    ControlImageView(icon: "arrow.up.left.and.down.right.magnifyingglass")
                }

                // Scale Up:
                Button {
                    scaleUp()
                } label: {
                    ControlImageView(icon: "plus.magnifyingglass")
                }
            }
            .padding(EdgeInsets(top: 12, leading: 20, bottom: 12, trailing: 20))
            .background(.ultraThinMaterial)
            .cornerRadius(12)
            .opacity(isAnimating ? 1 : 0)
        }
        .padding(.bottom, 30)
    }
}

struct ControlsView_Previews: PreviewProvider {
    static var previews: some View {
        ControlsView(isAnimating: true, imageScale: .constant(1), imageOffset: .constant(.zero), resetImageState: {})
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
