//
//  WatchView.swift
//  Africa
//
//  Created by Natalie Alvarez on 5/24/23.
//

import SwiftUI

struct WatchView: View {
    @State var videos: [Video] = Bundle.main.decode("videos.json") // adding the "State" property wrapper will make it mutable (so that we can shuffle it)
    let haptics = UIImpactFeedbackGenerator(style: .medium)

    var body: some View {
        NavigationView {
            List {
                ForEach(videos) { video in
                    NavigationLink(destination: VideoPlayerView(fileName: video.id, title: video.name)){
                        VideoListItemView(video: video)
                            .padding(.vertical, 8)
                    }
                }
            }
            .listStyle(InsetGroupedListStyle())
            .navigationBarTitle("Videos", displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        videos.shuffle()
                        haptics.impactOccurred()
                    }) {
                        Image(systemName: "arrow.2.squarepath")
                    }
                }
            }
        }
    }
}

struct VideoListView_Previews: PreviewProvider {
    static var previews: some View {
        WatchView()
    }
}
