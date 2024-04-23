//
//  LaunchScreen.swift
//  ManualSplash
//
//  Created by komainu-ya on 2024/04/21.
//

import SwiftUI

struct LaunchScreen: View {
    @State private var isLoading = true

    //TODO: スプラッシュ状態のフラグを切り替えることで、スプラッシュ終了あるいは再度スプラッシュ画面表示
    //TODO: フラグはMainViewModelのような共有の部分に持たせて、他からの要求をここでObserveできるようにする？
    var body: some View {
        if isLoading {
            ZStack {
                Color("Primary")
                    .ignoresSafeArea() // ステータスバーを超えて塗り潰す
                Image(systemName: "globe")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
            }
            .onAppear {
                _ = Task {
                    try await Task.sleep(nanoseconds: 3 * 1_000_000_000)
                    withAnimation {
                        isLoading = false
                    }
                }
            }
        } else {
            ContentView()
        }
    }
}

#Preview {
    LaunchScreen()
}
