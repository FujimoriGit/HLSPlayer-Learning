//
//  VideoListView.swift
//  HLSPlayer-Learning
//
//  Created by Daiki Fujimori on 2026/02/09
//

import SwiftUI

struct VideoListView: View {
    private let repository: VideoRepositoryProtocol
    private let videos: [Video]

    init(repository: VideoRepositoryProtocol = SampleVideoRepository()) {
        self.repository = repository
        self.videos = repository.fetchVideos()
    }

    var body: some View {
        NavigationStack {
            List(videos) { video in
                NavigationLink(value: video) {
                    VideoRow(video: video)
                }
            }
            .navigationTitle("HLS Player")
            .navigationDestination(for: Video.self) { video in
                PlayerView(video: video)
            }
        }
    }
}

private struct VideoRow: View {
    let video: Video

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(video.title)
                .font(.headline)
            Text(video.subtitle)
                .font(.subheadline)
                .foregroundStyle(.secondary)
        }
        .padding(.vertical, 4)
    }
}

#Preview {
    VideoListView()
}
