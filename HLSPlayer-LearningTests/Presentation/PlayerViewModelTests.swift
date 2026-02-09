//
//  PlayerViewModelTests.swift
//  HLSPlayer-LearningTests
//
//  Created by Daiki Fujimori on 2026/02/09
//

import AVFoundation
import Foundation
import Testing

@testable import HLSPlayer_Learning

@MainActor
struct PlayerViewModelTests {
    private func makeSUT() -> PlayerViewModel {
        let url = URL(string: "https://devstreaming-cdn.apple.com/videos/streaming/examples/bipbop_16x9/bipbop_16x9_variant.m3u8")!
        let video = Video(title: "テスト動画", hlsURL: url, subtitle: "テスト用")
        return PlayerViewModel(video: video)
    }

    @Test func 初期状態が_生成直後_再生していない() {
        let viewModel = makeSUT()

        #expect(!viewModel.isPlaying)
        #expect(!viewModel.isBuffering)
        #expect(viewModel.currentTime == 0)
        #expect(viewModel.errorMessage == nil)

        viewModel.cleanUp()
    }

    @Test func playerが_生成時に_AVPlayerインスタンスを持つ() {
        let viewModel = makeSUT()

        #expect(viewModel.player.currentItem != nil)

        viewModel.cleanUp()
    }

    @Test func videoが_生成時に_正しい動画情報を持つ() {
        let viewModel = makeSUT()

        #expect(viewModel.video.title == "テスト動画")
        #expect(viewModel.video.subtitle == "テスト用")

        viewModel.cleanUp()
    }

    @Test func cleanUpが_呼ばれた時_リソースが解放される() {
        let viewModel = makeSUT()
        viewModel.play()
        viewModel.cleanUp()

        #expect(viewModel.player.rate == 0)
    }
}
