//
//  ContentView.swift
//  WeSplit
//
//  Created by 박현준 on 7/16/25.
//

import SwiftUI

struct ContentView: View {
    @State private var tapCount = 0
    var body: some View {
        
        Button("Tap Count: \(tapCount)") {
            self.tapCount += 1
        }
        
    }
}

#Preview {
    ContentView()
}
