//
//  TACSampleApp.swift
//  TACSample
//
//  Created by komainu-ya on 2024/05/05.
//

import SwiftUI
import ComposableArchitecture

@main
struct TACSampleApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(
                store: Store(initialState: Feature.State()) {
                    Feature()
                }
            )
        }
    }
}
