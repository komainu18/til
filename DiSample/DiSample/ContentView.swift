//
//  ContentView.swift
//  DiSample
//
//  Created by komainu-ya on 2026/03/01.
//

import SwiftUI
import ComposableArchitecture

// --- 1. Repository 層 ---
public struct MessageRepository: Sendable {
    var fetch: @Sendable () async -> String
}

extension MessageRepository: DependencyKey {
    // 実際のデータ取得ロジック
    public static let liveValue = Self(fetch: {
        try? await Task.sleep(for: .seconds(1)) // 通信擬似待ち
        return "Repositoryから届いたデータです"
    })
}

// --- 2. Client 層 (Repositoryを注入) ---
public struct MessageClient: Sendable {
    var getMessage: @Sendable () async -> String
}

extension MessageClient: DependencyKey {
    public static var liveValue: Self {
        @Dependency(\.messageRepository) var repository // ここで注入
        return Self(getMessage: { await repository.fetch() })
    }
}

// --- 3. Dependency 登録 ---
extension DependencyValues {
    public var messageRepository: MessageRepository {
        get { self[MessageRepository.self] }
        set { self[MessageRepository.self] = newValue }
    }
    public var messageClient: MessageClient {
        get { self[MessageClient.self] }
        set { self[MessageClient.self] = newValue }
    }
}

