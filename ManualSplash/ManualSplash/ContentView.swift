//
//  ContentView.swift
//  ManualSplash
//
//  Created by komainu-ya on 2024/04/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Button("終わる", action: backToHomeScreenOfDevice)
                .foregroundColor(.white)
                .padding(.vertical)
                .padding(.horizontal, 20)
                .background {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.tint)
                }
        }
        .padding()
    }
    
    /**
     * アプリをバックグラウンドにする
     */
    private func backToHomeScreenOfDevice() {
        UIControl().sendAction(
            #selector(URLSessionTask.suspend),
            to: UIApplication.shared,
            for: nil
        )
    }
}

#Preview {
    ContentView()
}
