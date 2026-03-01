// The Swift Programming Language
// https://docs.swift.org/swift-book
import Dependencies
import InterfaceModule

extension MessageRepository {
    // 専用 live をpublicにする
    public static let live = Self(
        fetch: {
            // 実際のロジック
            try? await Task.sleep(for: .seconds(1)) // 通信擬似待ち
            return "Repositoryから届いたデータです"
        }
    )
}
