//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by 박현준 on 7/20/25.
//

import SwiftUI

struct FlagImage: View {
    let country: String
    
    var body: some View {
        Image(country)
            .clipShape(.capsule)
            .shadow(radius: 5)
    }
}

struct ContentView: View {
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var score = 0
    @State private var message = ""
    @State private var round = 1
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var choice = 3
    @State private var animationAmount = 0.0
    
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3),
            ], center: .top, startRadius: 200, endRadius: 700)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Text("Guess the Flag")
                    .font(.largeTitle.weight(.bold))
                    .foregroundStyle(.white)
                
                VStack(spacing: 15) {
                    VStack {
                        Text("Tap the flag of")
                            .font(.subheadline.weight(.heavy))
                            .foregroundStyle(.secondary)
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                    }
                    
                    ForEach(0..<3) { number in
                        Button {
                            choice = number
                            flagTapped(choice)
                            if choice == number {
                                withAnimation(.spring(duration: 1, bounce: 0.5)) {
                                    animationAmount += 360
                                }
                            }
                        } label: {
                            FlagImage(country: countries[number])
                        }
                        .rotation3DEffect(choice == number ? .degrees(animationAmount) : .degrees(0), axis: (x: 0, y: 1, z: 0))
                        .opacity(choice == 3 || choice == number ? 1 : 0.25)
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(.rect(cornerRadius: 20))
                
                Spacer()
                Spacer()
                
                Text("Score: \(score)")
                    .foregroundStyle(.white)
                    .font(.title.bold())
                
                Spacer()
            }
            .padding()
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button(round < 8 ? "Continue" : "Finish") {
                askQuestion()
                isReset()
            }
        } message: {
            Text("\(message)\nYour score is \(score) / \(round).")
        }
    }
    
    func isReset() {
        if round > 8 {
            score = 0
            round = 1
            scoreTitle = ""
            message = ""
        }
    }
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            score += 1
            message = "You got it right!"
        } else {
            scoreTitle = "Wrong"
            message = "Nope, it's \(countries[number])"
        }
        
        showingScore = true
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        round += 1
        choice = 3
    }
    
}

#Preview {
    ContentView()
}
