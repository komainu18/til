//
//  DiSampleApp.swift
//  DiSample
//
//  Created by komainu-ya on 2026/03/01.
//

import SwiftUI
import FeatureModule
import ComposableArchitecture
import InterfaceModule
import ImplementationModule
import ClientModule

@main
struct DiSampleApp: App {
    init() {
        prepareDependencies {
            // Interface側の DependencyValues に Implementation側の実体を注入
            $0.messageRepository = .live
        }
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
