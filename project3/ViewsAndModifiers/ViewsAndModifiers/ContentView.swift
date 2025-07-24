//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by 박현준 on 7/24/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Button("Hello World") {
            print(type(of: self.body))
        }
        .frame(width: 200, height: 200)
        .background(.red)
    }
}

#Preview {
    ContentView()
}
