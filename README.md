# HLSPlayer-Learning

HLS動画配信技術の学習用iOSアプリ

## 技術スタック

- Swift 6
- SwiftUI
- AVFoundation
- Clean Architecture

## ブランチ戦略

| ブランチ | 用途 |
|---------|------|
| main | リリース可能な状態 |
| develop | 開発ブランチ |
| feature/* | 機能開発 |
| fix/* | バグ修正 |

## セットアップ

```bash
git clone https://github.com/FujimoriGit/HLSPlayer-Learning.git
```

Xcodeで開いてビルド

## CI/CD

GitHub Actions（後述のPhaseで追加予定）

## 参考

- https://speakerdeck.com/play_inc/dong-hua-pei-xin-noji-shu-nituite-slash-zhu-shi-hui-she-play
- https://devstreaming-cdn.apple.com/videos/streaming/examples/bipbop_16x9/bipbop_16x9_variant.m3u8
