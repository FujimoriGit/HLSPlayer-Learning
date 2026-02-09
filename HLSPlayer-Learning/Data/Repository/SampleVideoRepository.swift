//
//  SampleVideoRepository.swift
//  HLSPlayer-Learning
//
//  Created by Daiki Fujimori on 2026/02/09
//

import Foundation

nonisolated struct SampleVideoRepository: VideoRepositoryProtocol {
    func fetchVideos() -> [Video] {
        var videos: [Video] = []

        if let bipbopURL = URL(string: "https://devstreaming-cdn.apple.com/videos/streaming/examples/bipbop_16x9/bipbop_16x9_variant.m3u8") {
            videos.append(
                Video(
                    title: "Bipbop サンプル",
                    hlsURL: bipbopURL,
                    subtitle: "Apple提供のHLSサンプルストリーム（マルチビットレート）"
                )
            )
        }

        if let advancedURL = URL(string: "https://devstreaming-cdn.apple.com/videos/streaming/examples/adv_dv_atmos/main.m3u8") {
            videos.append(
                Video(
                    title: "Advanced Stream",
                    hlsURL: advancedURL,
                    subtitle: "Dolby Vision + Dolby Atmos対応のサンプルストリーム"
                )
            )
        }

        return videos
    }
}
