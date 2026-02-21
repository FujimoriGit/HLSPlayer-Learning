//
//  VideoFetching.swift
//  HLSPlayer-Learning
//
//  Created by Daiki Fujimori on 2026/02/09
//

protocol VideoFetching: Sendable {
    func fetchVideos() -> [Video]
}
