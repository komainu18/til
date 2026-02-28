//
//  ContentView.swift
//  DiSample
//
//  Created by komainu-ya on 2026/03/01.
//

import SwiftUI
import ComposableArchitecture

// --- 1. Repository 層 ---
struct MessageRepository: Sendable {
    var fetch: @Sendable () async -> String
}

extension MessageRepository: DependencyKey {
    // 実際のデータ取得ロジック
    static let liveValue = Self(fetch: {
        try? await Task.sleep(for: .seconds(1)) // 通信擬似待ち
        return "Repositoryから届いたデータです"
    })
}

// --- 2. Client 層 (Repositoryを注入) ---
struct MessageClient: Sendable {
    var getMessage: @Sendable () async -> String
}

extension MessageClient: DependencyKey {
    static var liveValue: Self {
        @Dependency(\.messageRepository) var repository // ここで注入
        return Self(getMessage: { await repository.fetch() })
    }
}

// --- 3. Dependency 登録 ---
extension DependencyValues {
    var messageRepository: MessageRepository {
        get { self[MessageRepository.self] }
        set { self[MessageRepository.self] = newValue }
    }
    var messageClient: MessageClient {
        get { self[MessageClient.self] }
        set { self[MessageClient.self] = newValue }
    }
}

// --- 4. Feature (Reducer) ---
@Reducer
struct Feature {
    @ObservableState
    struct State: Equatable {
        var text = "待機中..."
        var isLoading = false
    }
    enum Action {
        case buttonTapped
        case response(String)
    }
    
    @Dependency(\.messageClient) var messageClient
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .buttonTapped:
                state.isLoading = true
                return .run { send in
                    let msg = await messageClient.getMessage()
                    await send(.response(msg))
                }
            case let .response(msg):
                state.isLoading = false
                state.text = msg
                return .none
            }
        }
    }
}

// --- 5. View ---
struct ContentView: View {
    let store = Store(initialState: Feature.State()) { Feature() }
    
    var body: some View {
        VStack(spacing: 20) {
            Text(store.text)
                .font(.headline)
            
            Button("データを取得") {
                store.send(.buttonTapped)
            }
            .disabled(store.isLoading)
            
            if store.isLoading {
                ProgressView()
            }
        }
    }
}
