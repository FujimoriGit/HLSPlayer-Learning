//
//  VideoTests.swift
//  HLSPlayer-LearningTests
//
//  Created by Daiki Fujimori on 2026/02/09
//

import Foundation
import Testing

@testable import HLSPlayer_Learning

struct VideoTests {
    
    @Test
    func 動画が_指定された情報で_作成される() {
        // Given
        guard let url = URL(string: "https://example.com/stream.m3u8") else {
            Issue.record("テスト用URLの生成に失敗")
            return
        }

        // When
        let video = Video(hlsURL: url, title: "テスト動画", subtitle: "テスト用")

        // Then
        #expect(video.title == "テスト動画")
        #expect(video.hlsURL == url)
        #expect(video.subtitle == "テスト用")
    }

    @Test
    func 動画が_異なるインスタンスで_異なる識別子を持つ() {
        // Given
        guard let url = URL(string: "https://example.com/stream.m3u8") else {
            Issue.record("テスト用URLの生成に失敗")
            return
        }

        // When
        let video1 = Video(hlsURL: url, title: "動画1", subtitle: "説明1")
        let video2 = Video(hlsURL: url, title: "動画2", subtitle: "説明2")

        // Then
        #expect(video1.id != video2.id)
    }

    @Test
    func 動画が_指定した識別子で_作成される() {
        // Given
        guard let url = URL(string: "https://example.com/stream.m3u8") else {
            Issue.record("テスト用URLの生成に失敗")
            return
        }
        let fixedID = UUID()

        // When
        let video = Video(id: fixedID, hlsURL: url, title: "テスト", subtitle: "説明")

        // Then
        #expect(video.id == fixedID)
    }

    @Test
    func 同じ識別子の動画が_コレクション内で_重複排除される() {
        // Given
        guard let url = URL(string: "https://example.com/stream.m3u8") else {
            Issue.record("テスト用URLの生成に失敗")
            return
        }
        let id = UUID()
        let video1 = Video(id: id, hlsURL: url, title: "動画", subtitle: "説明")
        let video2 = Video(id: id, hlsURL: url, title: "動画", subtitle: "説明")

        // When
        let set: Set<Video> = [video1, video2]

        // Then
        #expect(set.count == 1)
    }
}
