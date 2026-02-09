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
    @Test func Videoが_正しいプロパティで_初期化される() {
        let url = URL(string: "https://example.com/stream.m3u8")!
        let video = Video(title: "テスト動画", hlsURL: url, subtitle: "テスト用")

        #expect(video.title == "テスト動画")
        #expect(video.hlsURL == url)
        #expect(video.subtitle == "テスト用")
    }

    @Test func Videoが_デフォルトIDで_UUIDが生成される() {
        let url = URL(string: "https://example.com/stream.m3u8")!
        let video1 = Video(title: "動画1", hlsURL: url, subtitle: "説明1")
        let video2 = Video(title: "動画2", hlsURL: url, subtitle: "説明2")

        #expect(video1.id != video2.id)
    }

    @Test func Videoが_指定IDで_そのIDが使われる() {
        let url = URL(string: "https://example.com/stream.m3u8")!
        let fixedID = UUID()
        let video = Video(id: fixedID, title: "テスト", hlsURL: url, subtitle: "説明")

        #expect(video.id == fixedID)
    }

    @Test func Videoが_Hashableに準拠しており_Setで使える() {
        let url = URL(string: "https://example.com/stream.m3u8")!
        let id = UUID()
        let video1 = Video(id: id, title: "動画", hlsURL: url, subtitle: "説明")
        let video2 = Video(id: id, title: "動画", hlsURL: url, subtitle: "説明")

        let set: Set<Video> = [video1, video2]
        #expect(set.count == 1)
    }
}
