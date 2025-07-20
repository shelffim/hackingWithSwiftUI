//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by 박현준 on 7/20/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                Color.red
                Color.blue
            }
            
            Text("Your content")
                .foregroundStyle(.secondary)
                .padding(50)
                .background(.ultraThinMaterial)
        }
        .ignoresSafeArea()
        
    }
}

#Preview {
    ContentView()
}
