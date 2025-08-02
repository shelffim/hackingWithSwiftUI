//
//  ContentView.swift
//  WordScramble
//
//  Created by 박현준 on 8/2/25.
//

import SwiftUI

struct ContentView: View {
    let people = ["Finn", "Leia", "Luke", "Rey"]
    var body: some View {
        List {
            Text("Static Row")
            
            ForEach(people, id: \.self) {
                Text($0)
            }
            
            Text("Static Row")
        }
    }
}

#Preview {
    ContentView()
}
