//
//  Feature.swift
//  TACSample
//
//  Created by komainu-ya on 2024/05/05.
//

import Foundation
import ComposableArchitecture

// Reducer(継手)

@Reducer
struct Feature {
    @ObservableState
    struct State: Equatable {
        var count = 0
        var numberFact: String?
    }
    
    enum Action: Equatable {
        case decrementButtonTapped
        case incrementButtonTapped
        case numberFactButtonTapped
        case numberFactResponse(String)
    }
    
    var body: some Reducer<State, Action> {
      Reduce { state, action in
        switch action {
        case .decrementButtonTapped:
          state.count -= 1
          return .none

        case .incrementButtonTapped:
          state.count += 1
          return .none

        case .numberFactButtonTapped:
          return .run { [count = state.count] send in
            let (data, _) = try await URLSession.shared.data(
              from: URL(string: "http://numbersapi.com/\(count)/trivia")!
            )
            await send(
              .numberFactResponse(String(decoding: data, as: UTF8.self))
            )
          }

        case let .numberFactResponse(fact):
          state.numberFact = fact
          return .none
        }
      }
    }
}
