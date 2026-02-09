//
//  VideoRepositoryProtocol.swift
//  HLSPlayer-Learning
//
//  Created by Daiki Fujimori on 2026/02/09
//

nonisolated protocol VideoRepositoryProtocol: Sendable {
    func fetchVideos() -> [Video]
}
