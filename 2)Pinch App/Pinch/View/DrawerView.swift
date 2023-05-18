//
//  DrawerView.swift
//  Pinch
//
//  Created by Natalie Alvarez on 5/17/23.
//

import SwiftUI

struct DrawerView: View {
    let pages: [Page]
    @Binding var pageIndex: Int
    @Binding var isAnimating: Bool
    @State private var isDrawerOpen: Bool = false

    // functions:
    func openAndCloseDrawer() {
        withAnimation(.easeOut) {
            isDrawerOpen.toggle()
        }
    }

    func setPageIndex(page: Page) {
        isAnimating = true
        pageIndex = page.id
    }

    var body: some View {
        ZStack {
            HStack(spacing: 12) {
                // Drawer Handle:
                Image(systemName: isDrawerOpen ? "chevron.compact.right" : "chevron.compact.left")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 40)
                    .padding(8)
                    .foregroundStyle(.secondary)
                    .onTapGesture(perform: {
                        openAndCloseDrawer()
                    })

                Spacer()

                // Thumbnails:
                ForEach(pages) { item in
                    Image(item.thumbnailName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80)
                        .cornerRadius(8)
                        .shadow(radius: 4)
                        .opacity(isDrawerOpen ? 1 : 0)
                        .animation(.easeOut(duration: 0.5), value: isDrawerOpen)
                        .onTapGesture(perform: {
                            setPageIndex(page: item)
                        })
                }

                Spacer()
            }
            .padding(EdgeInsets(top: 16, leading: 8, bottom: 16, trailing: 8))
            .background(.ultraThinMaterial)
            .cornerRadius(12)
            .opacity(isAnimating ? 1 : 0)
            .frame(width: 260)
            .padding(.top, UIScreen.main.bounds.height / 12) //UIScreen.main.bounds.height = the actual height of the device's screen
            .offset(x: isDrawerOpen ? 20 : 215)
        }
    }
}

struct DrawerView_Previews: PreviewProvider {
    static var previews: some View {
        DrawerView(pages: pagesData, pageIndex: .constant(0), isAnimating: .constant(true))
    }
}
