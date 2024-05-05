//
//  ContentView.swift
//  TACSample
//
//  Created by komainu-ya on 2024/05/05.
//

import SwiftUI
import ComposableArchitecture

struct ContentView: View {
    let store: StoreOf<Feature>

    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
            Text("Hello, world!")
        }
        .padding()
    }
}

//#Preview {
//    ContentView()
//}
