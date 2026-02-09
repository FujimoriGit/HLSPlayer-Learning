//
//  VideoPlayerRepresentable.swift
//  HLSPlayer-Learning
//
//  Created by Daiki Fujimori on 2026/02/09
//

import AVKit
import SwiftUI

struct VideoPlayerRepresentable: UIViewControllerRepresentable {
    let player: AVPlayer

    func makeUIViewController(context: Context) -> AVPlayerViewController {
        let controller = AVPlayerViewController()
        controller.player = player
        controller.allowsPictureInPicturePlayback = true
        return controller
    }

    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {
        // プレイヤーの参照が変更された場合のみ更新
        if uiViewController.player !== player {
            uiViewController.player = player
        }
    }
}
