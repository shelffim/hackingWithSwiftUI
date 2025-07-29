//
//  ContentView.swift
//  RockPaperScissor
//
//  Created by 박현준 on 7/28/25.
//

import SwiftUI

struct ScaleButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
            .animation(.easeInOut(duration: 0.1), value: configuration.isPressed)
    }
}

struct ContentView: View {
    @State private var round = 1
    @State private var score = 0
    @State private var computerChoice = Int.random(in: 0..<3)
    
    @State private var winLoseDraw = ["Win", "Lose", "Draw"].shuffled()
    
    let gameHandEmoji = ["✊", "✋", "✌️"]
    let gameHand = ["Rock", "Paper", "Scissors"]
    let windHand = ["Paper", "Scissors", "Rock"]
    let loseHand = ["Scissors", "Rock", "Paper"]
    
    @State private var isDone = false
    
    var body: some View {
        
        ZStack {
            // 배경 그라데이션
            LinearGradient(
                colors: [.purple.opacity(0.3), .blue.opacity(0.3), .cyan.opacity(0.3)],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            // 메인 콘텐츠
            
            VStack {
                Spacer()
                
                Text("Rock, Paper or Scissors")
                    .font(.largeTitle.weight(.bold))
                    .foregroundStyle(.white)
                    .shadow(color: .black.opacity(0.3), radius: 2, x: 0, y: 2)
                
                VStack(spacing: 15) {
                    // 플레이어 점수, 컴퓨터 가위바위보, 승패
                    VStack {
                        Text("Your score is")
                            .font(.subheadline)
                            .foregroundStyle(.white.opacity(0.8))
                        Text("\(score)")
                            .font(.title.bold())
                            .foregroundStyle(.white)
                    }
                    
                    VStack {
                        Text(winLoseDraw[computerChoice])
                            .font(.subheadline)
                            .foregroundStyle(statusColor(winLoseDraw[computerChoice]))
                        Text(gameHand[computerChoice])
                            .font(.largeTitle.weight(.bold))
                            .foregroundStyle(.white)
                    }
                    
                    HStack(spacing: 20) {
                        ForEach(0..<3) { number in
                            Button {
                                choseRPS(number)
                                isFinished()
                            } label: {
                                Text(gameHandEmoji[number])
                                    .font(.system(size: 60))
                                    .frame(width: 100, height: 100)
                                    .background(
                                        RoundedRectangle(cornerRadius: 15)
                                            .fill(.white.opacity(0.2))
                                            .stroke(.white, lineWidth: 2)
                                    )
                            }
                            .buttonStyle(ScaleButtonStyle())
                        }
                    }
                }
                .padding(.vertical, 20)
                
                Spacer()
            }
        }
        .alert("\(round) \n \(score)",isPresented: $isDone) {
            Button("Retry", role: .cancel) {
                round = 1
                score = 0
                computerChoice = Int.random(in: 0..<3)
            }
        }
    }
    
    func statusColor(_ status: String) -> Color {
        switch status {
        case "Win":
            return .green
        case "Lose":
            return .red
        case "Draw":
            return .gray
        default:
            return .black
        }
    }
    
    func choseRPS(_ number: Int) {
//        print("\(computerChoice) status: \(winLoseDraw[computerChoice]) player: \(gameHand[number]) computer: \(gameHand[computerChoice])")
        switch winLoseDraw[computerChoice] {
        case "Win":
            if gameHand[number] == windHand[computerChoice] {
                score += 1
            } else if gameHand[number] == loseHand[computerChoice] {
                score -= 2
            } else {
                score -= 1
            }
        case "Lose":
            if gameHand[number] == loseHand[computerChoice] {
                score += 1
            } else if gameHand[number] == windHand[computerChoice] {
                score -= 2
            } else {
                score -= 1
            }
        case "Draw":
            if gameHand[number] == gameHand[computerChoice] {
                score += 2
            } else {
                score -= 1
            }
        default:
            break
        }
    }
    
    func isFinished() {
        if round == 10 {
            isDone.toggle()
        } else {
            round += 1
            computerChoice = Int.random(in: 0..<3)
        }
    }
    
}

#Preview {
    ContentView()
}
