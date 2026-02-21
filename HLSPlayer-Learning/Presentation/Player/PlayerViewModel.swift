//
//  PlayerViewModel.swift
//  HLSPlayer-Learning
//
//  Created by Daiki Fujimori on 2026/02/09
//

import AVFoundation
import Observation

@Observable
final class PlayerViewModel {
    let video: Video
    let player: AVPlayer

    private(set) var isPlaying = false
    private(set) var isBuffering = false
    private(set) var currentTime: Double = 0
    private(set) var duration: Double = 0
    private(set) var errorMessage: String?

    private var timeObserver: Any?
    private var statusObservation: NSKeyValueObservation?
    private var timeControlObservation: NSKeyValueObservation?

    init(video: Video) {
        self.video = video
        self.player = AVPlayer(url: video.hlsURL)
        setupObservers()
    }
}

// MARK: - events from view

extension PlayerViewModel {
    
    func onAppear() {
        play()
    }

    func onDisappear() {
        cleanUp()
    }

    func tappedPlayback() {
        if isPlaying {
            pause()
        } else {
            play()
        }
    }

    func seek(to seconds: Double) {
        let time = CMTime(seconds: seconds, preferredTimescale: 600)
        player.seek(to: time)
    }
}

// MARK: - private method

private extension PlayerViewModel {
    
    func play() {
        player.play()
    }

    func pause() {
        player.pause()
    }
    
    func cleanUp() {
        pause()
        if let timeObserver {
            player.removeTimeObserver(timeObserver)
        }
        timeObserver = nil
        statusObservation?.invalidate()
        statusObservation = nil
        timeControlObservation?.invalidate()
        timeControlObservation = nil
    }

    func setupObservers() {
        setupTimeObserver()
        setupPlayerStatusObserver()
        setupTimeControlStatusObserver()
    }
    
    func setupTimeObserver() {
        // 再生時間の定期監視（0.5秒間隔）
        let interval = CMTime(seconds: 0.5, preferredTimescale: 600)
        timeObserver = player.addPeriodicTimeObserver(forInterval: interval, queue: .main) { [weak self] time in
            
            Task { @MainActor in
                
                guard let self else { return }
                self.currentTime = time.seconds

                if let currentItem = self.player.currentItem {
                    
                    let itemDuration = currentItem.duration
                    if itemDuration.isNumeric {
                        self.duration = itemDuration.seconds
                    }
                }
            }
        }
    }
    
    func setupPlayerStatusObserver() {
        // プレイヤーアイテムのステータス監視
        statusObservation = player.currentItem?.observe(\.status, options: [.new]) { [weak self] item, _ in
            Task { @MainActor in
                guard let self else { return }
                switch item.status {
                case .failed:
                    self.errorMessage = item.error?.localizedDescription ?? "再生エラーが発生しました"
                case .readyToPlay:
                    self.errorMessage = nil
                case .unknown:
                    break
                @unknown default:
                    break
                }
            }
        }
    }
    
    func setupTimeControlStatusObserver() {
        // 再生状態の監視
        timeControlObservation = player.observe(\.timeControlStatus, options: [.new]) { [weak self] player, _ in
            Task { @MainActor in
                guard let self else { return }
                switch player.timeControlStatus {
                case .playing:
                    self.isPlaying = true
                    self.isBuffering = false
                case .paused:
                    self.isPlaying = false
                    self.isBuffering = false
                case .waitingToPlayAtSpecifiedRate:
                    self.isBuffering = true
                @unknown default:
                    break
                }
            }
        }
    }
}
