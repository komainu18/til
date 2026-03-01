//  ContentView.swift
//  FeatureModule
import SwiftUI
import ComposableArchitecture

public struct ContentView: View {
    let store: StoreOf<Feature>
    
    public init (store: StoreOf<Feature> = Store(initialState: Feature.State()) {
        Feature()
    }) {
        self.store = store
    }

    public var body: some View {
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
#Preview("通常時") {
    ContentView(
        store: Store(initialState: Feature.State()) {
            Feature()
        }
    )
}

#Preview("エラー発生時") {
    ContentView(
        store: Store(initialState: Feature.State()) {
            Feature()
        } withDependencies: {
            // このプレビューの中だけ Repository の挙動を差し替える
            $0.messageRepository.fetch = { "通信エラーが発生しました" }
        }
    )
}
