//
//  ContentView.swift
//  LocalLocalize
//
//  Created by komainu-ya on 2024/04/24.
//

import SwiftUI

/**
 * ローカライズをアプリで指定する。
 */
struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("HelloWorld")
                .environment(\.locale, Locale(identifier: "ja_JP"))
            Text("HelloWorld")
                .environment(\.locale, Locale(identifier: "en_US"))
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text(String(localized: "HelloWorld", lang: "ja"))
            Text(String(localized: "HelloWorld", lang: "en"))
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
