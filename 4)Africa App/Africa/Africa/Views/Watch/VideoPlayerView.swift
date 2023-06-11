//
//  VideoPlayerView.swift
//  Africa
//
//  Created by Natalie Alvarez on 5/24/23.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
    var fileName: String
    var title: String

    var body: some View {
        VStack {
            VideoPlayer(player: playVideo(fileName: fileName, fileFormat: "mp4")) {
            }
            .overlay(
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32, height: 32)
                    .padding(.top, 6)
                    .padding(.horizontal, 8)
                , alignment: .topLeading
            )
        }
        .accentColor(.accentColor)
        .navigationBarTitle(title, displayMode: .inline)
    }
}

struct VideoPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            VideoPlayerView(fileName: "lion", title: "Lion")
        }
    }
}
