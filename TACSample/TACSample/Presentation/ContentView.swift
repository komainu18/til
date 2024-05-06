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
    
    @State var inputText = ""

    var body: some View {
        VStack {
            // 郵便番号入力
            TextField("郵便番号", text: $inputText)
                .textFieldStyle(.roundedBorder)
                .padding()
                .onSubmit {
                    //郵便番号を入力後、エンターが押された
                    store.send(.requestAddressFromZip(inputText))
                }
            // 結果
            if let result = store.address {
                Text(result)
                    .font(.largeTitle)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView(
        store: Store(initialState: Feature.State()) {
            Feature()
        }
    )
}
