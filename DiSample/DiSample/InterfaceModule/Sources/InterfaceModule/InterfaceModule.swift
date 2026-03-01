// The Swift Programming Language
// https://docs.swift.org/swift-book

import Dependencies


public struct MessageRepository: Sendable {
    public var fetch: @Sendable () async -> String
    // 外部（Client層）からインスタンスを作れるようにpublic initが必要
    public init(fetch: @escaping @Sendable () async -> String) {
        self.fetch = fetch
    }
}

// キーの登録（ここでは実装を書かない）
extension MessageRepository: DependencyKey {
    // デフォルト
    public static let liveValue = Self(
        fetch: {
            fatalError("MessageRepository の実体(liveValue)が登録されていません。")
        }
    )
    
    // プレビュー実行時に自動で呼ばれる
    public static let previewValue = Self(
        fetch: { "プレビュー用のダミーデータ" }
    )
}

extension DependencyValues {
    public var messageRepository: MessageRepository {
        get { self[MessageRepository.self] }
        set { self[MessageRepository.self] = newValue }
    }
}
