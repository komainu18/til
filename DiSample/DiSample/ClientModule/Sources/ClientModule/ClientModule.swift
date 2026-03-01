import InterfaceModule
import ComposableArchitecture

public struct MessageClient: Sendable {
    public var getMessage: @Sendable () async -> String
    public init(getMessage: @escaping @Sendable () async -> String) {
        self.getMessage = getMessage
    }
}

extension MessageClient: DependencyKey {
    public static var liveValue: Self {
        @Dependency(\.messageRepository) var repository
        return Self(getMessage: { await repository.fetch() })
    }
}

extension DependencyValues {
    public var messageClient: MessageClient {
        get { self[MessageClient.self] }
        set { self[MessageClient.self] = newValue }
    }
}

