// MessageClient.swift / ClientModule
import ComposableArchitecture
import InterfaceModule

public struct MessageClient: Sendable {
    public var getMessage: @Sendable () async -> String
    public init(getMessage: @escaping @Sendable () async -> String) {
        self.getMessage = getMessage
    }
}

// キーの登録 Clientの実体をここに書く
extension MessageClient: DependencyKey {
    public static var liveValue: Self {
        @Dependency(\.messageRepository) var repository // リポジトリの実体を注入
        return Self(getMessage: {
            await repository.fetch()
        })
    }
}
// 注入元の登録(Providerとかコンテナとか)
extension DependencyValues {
    public var messageClient: MessageClient {
        get { self[MessageClient.self] }
        set { self[MessageClient.self] = newValue }
    }
}
