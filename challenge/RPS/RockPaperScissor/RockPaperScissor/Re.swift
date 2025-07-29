////
////  ContentView.swift
////  RockPaperScissor
////
////  Created by 박현준 on 7/28/25.
////
//
//import SwiftUI
//
//struct ScaleButtonStyle: ButtonStyle {
//    func makeBody(configuration: Configuration) -> some View {
//        configuration.label
//            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
//            .animation(.easeInOut(duration: 0.1), value: configuration.isPressed)
//    }
//}
//
//enum GameHand: String {
//    case rock = "Rock"
//    case paper = "Paper"
//    case scissor = "Scissor"
//}
//
//enum GameStatus: String {
//    case win = "Win"
//    case lose = "Lose"
//    case draw = "Draw"
//}
//
//struct ContentView: View {
//    let gameHand = [GameHand.rock, GameHand.paper, GameHand.scissor]
//    let gameHandEmoji = ["✊", "✋", "✌️"]
//    private let status = [GameStatus.win, GameStatus.lose, GameStatus.draw]
//    @State private var computerChoice = Int.random(in: 0...2)
//    @State private var score = 0
//
//    let winHand = [GameHand.paper, GameHand.scissor, GameHand.rock]
//    let loseHand = [GameHand.scissor, GameHand.rock, GameHand.paper]
//    
//    var body: some View {
//        ZStack {
//            // 배경 그라데이션
//            LinearGradient(
//                colors: [.purple.opacity(0.3), .blue.opacity(0.3), .cyan.opacity(0.3)],
//                startPoint: .topLeading,
//                endPoint: .bottomTrailing
//            )
//            .ignoresSafeArea()
//            
//            // 배경 패턴 (가위바위보 이모지들)
//            // VStack(spacing: 0) {
//            //     // 상단 패턴 (2줄)
//            //     ForEach(0..<2) { _ in
//            //         HStack(spacing: 0) {
//            //             ForEach(0..<8) { _ in
//            //                 Text(gameHandEmoji.randomElement() ?? "✊")
//            //                     .font(.system(size: 30))
//            //                     .opacity(0.4)
//            //                     .frame(maxWidth: .infinity, maxHeight: .infinity)
//            //             }
//            //         }
//            //     }
//                
//            //     Spacer()
//                
//            //     // 하단 패턴 (2줄)
//            //     ForEach(0..<2) { _ in
//            //         HStack(spacing: 0) {
//            //             ForEach(0..<8) { _ in
//            //                 Text(gameHandEmoji.randomElement() ?? "✊")
//            //                     .font(.system(size: 30))
//            //                     .opacity(0.4)
//            //                     .frame(maxWidth: .infinity, maxHeight: .infinity)
//            //             }
//            //         }
//            //     }
//            // }
//            // .rotationEffect(.degrees(15))
//            // .frame(maxWidth: .infinity, maxHeight: .infinity)
//            // .ignoresSafeArea()
//            
//            // 메인 콘텐츠
//            VStack {
//                Spacer()
//                
//                Text("Rock, Paper or Scissors")
//                    .font(.largeTitle.weight(.bold))
//                    .foregroundStyle(.white)
//                    .shadow(color: .black.opacity(0.3), radius: 2, x: 0, y: 2)
//                
//                VStack(spacing: 15) {
//                    // 플레이어 점수, 컴퓨터 가위바위보, 승패
//                    VStack {
//                        Text("Your score is")
//                            .font(.subheadline)
//                            .foregroundStyle(.white.opacity(0.8))
//                        Text("\(score)")
//                            .font(.title.bold())
//                            .foregroundStyle(.white)
//                    }
//                    
//                    VStack {
//                        Text(status[computerChoice].rawValue)
//                            .font(.subheadline)
//                            .foregroundStyle(statusColor(status[computerChoice].rawValue))
//                        Text(gameHand[computerChoice].rawValue)
//                            .font(.largeTitle.weight(.bold))
//                            .foregroundStyle(.white)
//                    }
//                    
//                    HStack(spacing: 20) {
//                        ForEach(0..<3) { number in
//                            Button {
//                                choseRPS(number)
//                            } label: {
//                                Text(gameHandEmoji[number])
//                                    .font(.system(size: 60))
//                                    .frame(width: 100, height: 100)
//                                    .background(
//                                        RoundedRectangle(cornerRadius: 15)
//                                            .fill(.white.opacity(0.2))
//                                            .stroke(.white, lineWidth: 2)
//                                    )
//                            }
//                            .buttonStyle(ScaleButtonStyle())
//                        }
//                    }
//                }
//                .padding(.vertical, 20)
//                
//                Spacer()
//            }
//        }
//    }
//    
//    func statusColor(_ s: String) -> Color {
//        if s == "Win" {
//            return .green
//        } else if s == "Lose" {
//            return .red
//        } else if s == "draw" {
//            return .gray
//        } else {
//            return .black
//        }
//    }
//    
//    func choseRPS(_ number: Int) {
//        print(computerChoice)
//        switch status[computerChoice] {
//            case GameStatus.win:
//                if gameHand[number] == winHand[computerChoice] {
//                    score += 1
//                } else if gameHand[number] == loseHand[computerChoice] {
//                    score -= 2
//                } else {
//                    score -= 1
//                }
//            case GameStatus.lose:
//                if gameHand[number] == loseHand[computerChoice] {
//                    score += 1
//                } else if gameHand[number] == winHand[computerChoice] {
//                    score -= 2
//                } else {
//                    score -= 1
//                }
//            case GameStatus.draw:
//                if gameHand[number] == gameHand[computerChoice] {
//                    score += 1
//                } else {
//                    score -= 1
//                }
//            default:
//                break
//        }
//    }
//}
//
//#Preview {
//    ContentView()
//}
