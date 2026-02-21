//
//  Video.swift
//  HLSPlayer-Learning
//
//  Created by Daiki Fujimori on 2026/02/09
//

import Foundation

struct Video: Identifiable, Sendable, Hashable {
    let id: UUID
    let hlsURL: URL
    let title: String
    let subtitle: String
    
    init(
        id: UUID = UUID(),
        hlsURL: URL,
        title: String,
        subtitle: String
    ) {
        self.id = id
        self.hlsURL = hlsURL
        self.title = title
        self.subtitle = subtitle
    }
}
