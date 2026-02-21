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
        let video = Video(hlsURL: url, title: "テスト動画", subtitle: "テスト用")
        return PlayerViewModel(video: video)
    }

    @Test func 再生が_画面を離れた時_停止する() {
        let viewModel = makeSUT()
        viewModel.onAppear()
        viewModel.onDisappear()

        #expect(viewModel.player.rate == .zero)
    }
}
