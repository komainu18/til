// MessageRepository+Impl.swift / ImplementationModule
import Dependencies
import InterfaceModule

extension MessageRepository {
    // ここにRepository層に注入する、インフラ実装などを書く
    public static let impl = Self(
        fetch: {
            try? await Task.sleep(for: .seconds(1)) // 通信擬似待ち
            return "Repositoryから届いたデータです"
        }
    )
}
