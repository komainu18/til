// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation
import ComposableArchitecture
import ClientModule

@Reducer
public struct Feature : Sendable{
    public init() {}

    @ObservableState
    public struct State: Equatable {
        var text: String
        var isLoading: Bool
        
        public init() {
            text = "待機中..."
            isLoading = false
        }
    }
    public enum Action {
        case buttonTapped
        case response(String)
    }
    
    @Dependency(\.messageClient) var messageClient
    
    public var body: some Reducer<State, Action> {
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
