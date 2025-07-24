//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by 박현준 on 7/24/25.
//

import SwiftUI

struct ContentView: View {
    @State private var useRedText = false
    
    var body: some View {
        VStack {
            Text("Gryffindor")
                .blur(radius: 0)
            Text("Hufflepuff")
            Text("Ravenclaw")
            Text("Slytherin")
        }
        .blur(radius: 5)
    }
}

#Preview {
    ContentView()
}
