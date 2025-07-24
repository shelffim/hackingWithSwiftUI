//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by 박현준 on 7/24/25.
//

import SwiftUI

struct ContentView: View {
    var motto1: some View {
        Text("Draco dormiens")
    }
    let motto2 = Text("nunquam titillandus")
    var spells1: some View {
        VStack {
            Text("Lumos")
            Text("Obliviate")
        }
    }
    var spells2: some View {
        Group {
            Text("Lumos")
            Text("Obliviate")
        }
    }
    @ViewBuilder var spells: some View {
        Text("Lumos")
        Text("Obliviate")
    }
    
    var body: some View {
        VStack {
            motto1
                .foregroundStyle(.red)
            motto2
                .foregroundStyle(.blue)
        }
    }
}

#Preview {
    ContentView()
}
