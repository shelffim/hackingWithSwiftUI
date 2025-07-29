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
                colors: [.purple.opacity(0.6), .blue.opacity(0.6), .cyan.opacity(0.6)],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            // 상단 게임핸드 이모지 배경
            VStack {
                HStack(spacing: 15) {
                    ForEach(0..<3) { index in
                        Text(gameHandEmoji[index])
                            .font(.system(size: 30))
                            .foregroundStyle(.white.opacity(0.08))
                    }
                }
                .rotationEffect(.degrees(10))
                .offset(x: -20, y: 5)
                
                HStack(spacing: 15) {
                    ForEach(0..<3) { index in
                        Text(gameHandEmoji[index])
                            .font(.system(size: 30))
                            .foregroundStyle(.white.opacity(0.08))
                    }
                }
                .rotationEffect(.degrees(-10))
                .offset(x: 20, y: -5)
                
                Spacer()
            }
            .padding(.top, 30)
            
            // 하단 게임핸드 이모지 배경
            VStack {
                Spacer()
                
                HStack(spacing: 15) {
                    ForEach(0..<3) { index in
                        Text(gameHandEmoji[index])
                            .font(.system(size: 30))
                            .foregroundStyle(.white.opacity(0.08))
                    }
                }
                .rotationEffect(.degrees(-10))
                .offset(x: -20, y: -5)
                
                HStack(spacing: 15) {
                    ForEach(0..<3) { index in
                        Text(gameHandEmoji[index])
                            .font(.system(size: 30))
                            .foregroundStyle(.white.opacity(0.08))
                    }
                }
                .rotationEffect(.degrees(10))
                .offset(x: 20, y: 5)
            }
            .padding(.bottom, 30)
            
            // 메인 콘텐츠
            
            VStack {
                Spacer()
                
                Text("Rock, Paper or Scissors")
                    .font(.largeTitle.weight(.bold))
                    .foregroundStyle(.white)
                    .shadow(color: .black.opacity(0.5), radius: 3, x: 0, y: 2)
                
                VStack(spacing: 20) {
                    // 라운드 정보
                    HStack {
                        Text("Round \(round)/10")
                            .font(.headline)
                            .foregroundStyle(.white.opacity(0.9))
                            .padding(.horizontal, 16)
                            .padding(.vertical, 8)
                            .background(
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(.white.opacity(0.2))
                            )
                    }
                    
                    // 플레이어 점수
                    VStack(spacing: 8) {
                        Text("Your Score")
                            .font(.headline)
                            .foregroundStyle(.white)
                        Text("\(score)")
                            .font(.system(size: 48, weight: .bold, design: .rounded))
                            .foregroundStyle(.white)
                            .shadow(color: .black.opacity(0.6), radius: 3, x: 0, y: 2)
                    }
                    .padding(.horizontal, 24)
                    .padding(.vertical, 16)
                    .background(
                        RoundedRectangle(cornerRadius: 15)
                            .fill(.white.opacity(0.15))
                            .stroke(.white.opacity(0.3), lineWidth: 1)
                    )
                    
                    // 컴퓨터 선택 및 승패 조건
                    VStack(spacing: 12) {
                        Text("Computer's Goal")
                            .font(.subheadline)
                            .foregroundStyle(.white)
                        
                        Text(winLoseDraw[computerChoice])
                            .font(.title2.weight(.semibold))
                            .foregroundStyle(statusColor(winLoseDraw[computerChoice]))
                            .padding(.horizontal, 16)
                            .padding(.vertical, 6)
                            .background(
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(statusColor(winLoseDraw[computerChoice]).opacity(0.2))
                            )
                        
                        Text(gameHand[computerChoice])
                            .font(.largeTitle.weight(.bold))
                            .foregroundStyle(.white)
                            .shadow(color: .black.opacity(0.6), radius: 3, x: 0, y: 2)
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 16)
                    .background(
                        RoundedRectangle(cornerRadius: 15)
                            .fill(.white.opacity(0.1))
                            .stroke(.white.opacity(0.2), lineWidth: 1)
                    )
                    
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
        .alert("게임 종료!", isPresented: $isDone) {
            Button("다시 시작", role: .cancel) {
                round = 1
                score = 0
                computerChoice = Int.random(in: 0..<3)
                winLoseDraw = ["Win", "Lose", "Draw"].shuffled()
            }
        } message: {
            Text("총 \(round)라운드를 진행했습니다.\n최종 점수: \(score)점")
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
            // 매 라운드마다 승패 조건을 랜덤하게 변경
            winLoseDraw = ["Win", "Lose", "Draw"].shuffled()
        }
    }
    
}

#Preview {
    ContentView()
}
