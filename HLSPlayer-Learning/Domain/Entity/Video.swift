//
//  Video.swift
//  HLSPlayer-Learning
//
//  Created by Daiki Fujimori on 2026/02/09
//

import Foundation

nonisolated struct Video: Identifiable, Sendable, Hashable {
    let id: UUID
    let title: String
    let hlsURL: URL
    let subtitle: String

    init(id: UUID = UUID(), title: String, hlsURL: URL, subtitle: String) {
        self.id = id
        self.title = title
        self.hlsURL = hlsURL
        self.subtitle = subtitle
    }
}
