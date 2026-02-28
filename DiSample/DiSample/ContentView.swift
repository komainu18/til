//
//  ContentView.swift
//  DiSample
//
//  Created by komainu-ya on 2026/03/01.
//

import SwiftUI
import ComposableArchitecture
import InterfaceModule

// --- 1. Repository 層 ---
public struct MessageRepository: Sendable {
    var fetch: @Sendable () async -> String
}

// --- 2. Client 層 (Repositoryを注入) ---
public struct MessageClient: Sendable {
    var getMessage: @Sendable () async -> String
}
