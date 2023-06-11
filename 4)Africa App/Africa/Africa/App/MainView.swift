//
//  MainView.swift
//  Africa
//
//  Created by Natalie Alvarez on 5/24/23.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            BrowseView()
                .tabItem {
                    Image(systemName: "square.grid.2x2")
                    Text("Browse")
                }

            WatchView()
                .tabItem {
                    Image(systemName: "play.rectangle")
                    Text("Watch")
                }

            LocationsView()
                .tabItem {
                    Image(systemName: "map")
                    Text("Locations")
                }

            GalleryView()
                .tabItem {
                    Image(systemName: "photo")
                    Text("Gallery")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
