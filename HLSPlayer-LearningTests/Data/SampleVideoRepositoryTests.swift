//
//  SampleVideoRepositoryTests.swift
//  HLSPlayer-LearningTests
//
//  Created by Daiki Fujimori on 2026/02/09
//

import Foundation
import Testing

@testable import HLSPlayer_Learning

struct SampleVideoRepositoryTests {
    @Test func fetchVideosが_サンプル動画を_返す() {
        let repository = SampleVideoRepository()
        let videos = repository.fetchVideos()

        #expect(!videos.isEmpty)
    }

    @Test func fetchVideosが_有効なHLS_URLを_含む() {
        let repository = SampleVideoRepository()
        let videos = repository.fetchVideos()

        for video in videos {
            #expect(video.hlsURL.absoluteString.contains(".m3u8"))
        }
    }

    @Test func fetchVideosが_タイトルと説明を_持つ() {
        let repository = SampleVideoRepository()
        let videos = repository.fetchVideos()

        for video in videos {
            #expect(!video.title.isEmpty)
            #expect(!video.subtitle.isEmpty)
        }
    }

    @Test func fetchVideosが_Bipbopサンプルを_含む() {
        let repository = SampleVideoRepository()
        let videos = repository.fetchVideos()

        let hasBipbop = videos.contains { $0.title.contains("Bipbop") }
        #expect(hasBipbop)
    }
}
