//
//  VideoPlayerHelper.swift
//  Africa
//
//  Created by Natalie Alvarez on 5/24/23.
//

import Foundation
import AVKit

func playVideo(fileName: String, fileFormat: String) -> AVPlayer? {
    if let videoURL = Bundle.main.url(forResource: fileName, withExtension: fileFormat) {
        let videoPlayer = AVPlayer(url: videoURL)
        videoPlayer.play()
        return videoPlayer
    }
    return nil
}
