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
            //String(localized: "key", locale: Locale(identifier: "ja_JP"))

            //画像は名前分けするしかない？
            let name = "128x128"
            Image("\(name)ja")
            Text(String(localized: "HelloWorld", lang: "ja"))

            Image("\(name)en")
            Text(String(localized: "HelloWorld", lang: "en"))
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
