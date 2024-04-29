//
//  ContentView.swift
//  MyTime Watch App
//
//  Created by komainu-ya on 2024/04/27.
//

import SwiftUI
import ClockKit

struct ContentView: View {
    @ObservedObject private var viewModel = WatchViewModel()
    
    var body: some View {
        VStack {
            Button(action: {
                viewModel.countup()
            }) {
                Image(systemName: "arrowtriangle.up.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80.0, height: 80.0)
                    .foregroundColor(.pink)
            }
            .buttonStyle(.plain)
            Text(String(Int(viewModel.counter)))
                .font(.system(size: 64.0))
                .bold()
            Button(action: {
                viewModel.countdown()
            }) {
                Image(systemName: "arrowtriangle.down.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80.0, height: 80.0)
                    .foregroundColor(.blue)
            }
            .buttonStyle(.plain)
        }
        .padding()
    }
    
}

#Preview {
    ContentView()
}
