//
//  ContentView.swift
//  Pinch
//
//  Created by Natalie Alvarez on 5/13/23.
//

import SwiftUI

struct ContentView: View {
    @State var isAnimating: Bool = false
    @State var imageScale: CGFloat = 1
    @State var imageOffset: CGSize = .zero //or: CGSize(width: 0, height: 0) // CGSize is a coordinate vector. The width/height values can be positive or negative

    let pages: [Page] = pagesData
    @State var pageIndex: Int = 0


    func resetImageState() {
        return withAnimation(.spring) {
            imageScale = 1 // scale the image back to its original/small size
            imageOffset = .zero // return the magazine to its original position
        }
    }

    func getMagazineName() -> String {
        return pages[pageIndex].imageName
    }

    var body: some View {
        VStack {
            NavigationView {
                ZStack {
                    Color.clear

                    MagazineCoverView(imageName: getMagazineName(), isAnimating: isAnimating, imageScale: imageScale, imageOffset: imageOffset)

                        // MARK: Double Tap Gesture:
                        .onTapGesture(count: 2, perform: { // Double tap gesture (count = 2)
                            if imageScale == 1 { // if image is small, then scale it up
                                withAnimation(.spring()) {
                                    imageScale = 5
                                }
                            } else { // else if image is large, scale it down
                                resetImageState()
                            }
                        })
                        // MARK: Drag Gesture:
                        .gesture(
                            DragGesture() // to test this feature in the Live Preview, hold Option+drag mouse
                                // move magazine when the user drags it:
                                .onChanged { value in
                                    withAnimation(.linear(duration: 1)) {
                                        imageOffset = value.translation
                                    }
                                }
                                .onEnded { _ in // when the user finishes the drag gesture (i.e. releases the magazine):
                                    if imageScale <= 1 {
                                        resetImageState()
                                    }
                                }
                        )
                        // MARK: Magnification Gesture:
                        .gesture(
                            MagnificationGesture()
                                .onChanged { value in
                                    withAnimation(.linear(duration: 1)) {
                                        if imageScale >= 1 && imageScale <= 5 {
                                            imageScale = value
                                        }
                                    }
                                }
                                .onEnded { _ in // the boundaries need to be set after the onChanged function is finished  (i.e. when the magnification gesture ends)
                                    if imageScale > 5 {
                                        imageScale = 5
                                    } else if imageScale < 1 {
                                        resetImageState()
                                    }
                                }
                        )
                }
                .navigationTitle("Pinch & Zoom")
                .navigationBarTitleDisplayMode(.inline)
                .onAppear(perform: {
                    isAnimating = true
                })
                // MARK: Info Panel:
                .overlay(
                    InfoPanelView(scale: imageScale, offset: imageOffset)
                    , alignment: .top
                )
                // MARK: Controls:
                .overlay(
                    ControlsView(isAnimating: isAnimating, imageScale: $imageScale, imageOffset: $imageOffset, resetImageState: resetImageState)
                    , alignment: .bottom
                )

                // MARK: DRAWER:
                .overlay(
                    DrawerView(pages: pages, pageIndex: $pageIndex, isAnimating: $isAnimating)
                    , alignment: .topTrailing
                )
            }
            .navigationViewStyle(.stack) // "stack" style will avoid using the sidebar on iPad devices
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
