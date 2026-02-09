//
//  PlayerView.swift
//  HLSPlayer-Learning
//
//  Created by Daiki Fujimori on 2026/02/09
//

import SwiftUI

struct PlayerView: View {
    @State private var viewModel: PlayerViewModel

    init(video: Video) {
        _viewModel = State(initialValue: PlayerViewModel(video: video))
    }

    var body: some View {
        VStack(spacing: 0) {
            // HLSプレイヤー
            VideoPlayerRepresentable(player: viewModel.player)
                .aspectRatio(16 / 9, contentMode: .fit)

            // 動画情報
            VStack(alignment: .leading, spacing: 8) {
                Text(viewModel.video.title)
                    .font(.headline)

                Text(viewModel.video.subtitle)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)

                // 再生コントロール
                HStack(spacing: 16) {
                    Button {
                        viewModel.togglePlayback()
                    } label: {
                        Image(systemName: viewModel.isPlaying ? "pause.circle.fill" : "play.circle.fill")
                            .font(.system(size: 44))
                    }

                    if viewModel.isBuffering {
                        ProgressView()
                            .padding(.leading, 8)
                        Text("バッファリング中...")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }

                    Spacer()

                    // 再生時間表示
                    if viewModel.duration > 0 {
                        Text("\(formatTime(viewModel.currentTime)) / \(formatTime(viewModel.duration))")
                            .font(.caption)
                            .monospacedDigit()
                            .foregroundStyle(.secondary)
                    }
                }

                // シークバー
                if viewModel.duration > 0 {
                    Slider(
                        value: Binding(
                            get: { viewModel.currentTime },
                            set: { viewModel.seek(to: $0) }
                        ),
                        in: 0...viewModel.duration
                    )
                }

                // エラー表示
                if let errorMessage = viewModel.errorMessage {
                    Label(errorMessage, systemImage: "exclamationmark.triangle")
                        .font(.caption)
                        .foregroundStyle(.red)
                }
            }
            .padding()

            Spacer()
        }
        .navigationTitle(viewModel.video.title)
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            viewModel.play()
        }
        .onDisappear {
            viewModel.cleanUp()
        }
    }

    private func formatTime(_ seconds: Double) -> String {
        guard seconds.isFinite else { return "0:00" }
        let totalSeconds = Int(seconds)
        let minutes = totalSeconds / 60
        let secs = totalSeconds % 60
        return String(format: "%d:%02d", minutes, secs)
    }
}

#Preview {
    NavigationStack {
        if let url = URL(string: "https://devstreaming-cdn.apple.com/videos/streaming/examples/bipbop_16x9/bipbop_16x9_variant.m3u8") {
            PlayerView(video: Video(title: "サンプル", hlsURL: url, subtitle: "プレビュー用"))
        }
    }
}
