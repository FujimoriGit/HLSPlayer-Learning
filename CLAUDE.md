# Claude Code設定

このファイルには、Claude Codeがこのリポジトリで作業する際の永続的な指示が含まれています。

## 言語設定

**重要**: このプロジェクトでは、すべてのコミュニケーションを**日本語**で行ってください。

- プルリクエストのレビューコメントは日本語で記述する
- コミットメッセージは日本語で記述する
- Issue/PRへの返信やコメントは日本語で記述する
- コード内のコメントは日本語で記述する
- ドキュメント（README、CONTRIBUTING等）は日本語で記述する

## プロジェクト概要

HLS動画配信技術の学習用iOSアプリ。Swift 6 + SwiftUI + AVFoundation。

## アーキテクチャ

- Clean Architecture（Domain / Data / Presentation 層）
- SOLID原則を遵守

## コードレビュー時の観点

- Swift 6のStrict Concurrency準拠を確認
- force unwrap（!）の使用を指摘
- 命名規則: Swift API Design Guidelines に準拠しているか
- テストが追加されているか（新しいロジックには必須）
- 不要なimportがないか
- アクセス修飾子（internal/private/public）が適切か
- struct / class / actor が適切に使い分けられているか

## テスト方針

- Swift Testing フレームワーク使用（XCTestではない）
- テスト命名: 日本語で「〜が_〜の時_〜になる」
- Given/When/Then パターン

## レビュー方針

- 建設的なフィードバックを日本語で提供する
- セキュリティ、パフォーマンス、保守性の観点からレビューする
- 改善提案は具体的な例を含める
- レビューコメントは必ず日本語で記述すること
