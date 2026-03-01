// DiSampleApp.swift
import SwiftUI
import ComposableArchitecture
import FeatureModule
import ClientModule
import InterfaceModule
import ImplementationModule

@main
struct DiSampleApp: App {
    init() {
        prepareDependencies {
            // Interface層の DependencyValues に Implementation層の実体を注入
            $0.messageRepository = .impl
        }
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
