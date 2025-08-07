////
////  solution.swift
////  WordScramble
////
////  Solution for the three challenges:
////  1. Disallow answers that are shorter than three letters or are just our start word
////  2. Add a toolbar button that calls startGame(), so users can restart with a new word
////  3. Add a text view to track and show the player's score
////
//
//import SwiftUI
//
//struct ContentView: View {
//    @State private var usedWords = [String]()
//    @State private var rootWord = ""
//    @State private var newWord = ""
//    
//    @State private var errorTitle = ""
//    @State private var errorMessage = ""
//    @State private var showingError = false
//    
//    // Add score tracking
//    @State private var score = 0
//    
//    var body: some View {
//        NavigationStack {
//            List {
//                Section {
//                    TextField("Enter your word", text: $newWord)
//                        .autocapitalization(.none)
//                }
//                
//                Section {
//                    ForEach(usedWords, id: \.self) { word in
//                        HStack {
//                            Image(systemName: "\(word.count).circle")
//                            Text(word)
//                        }
//                    }
//                }
//            }
//            .navigationTitle(rootWord)
//            .toolbar {
//                ToolbarItem(placement: .topBarTrailing) {
//                    Button("New Word") {
//                        startGame()
//                    }
//                }
//            }
//            .onSubmit(addNewWord)
//            .onAppear(perform: startGame)
//            .alert(errorTitle, isPresented: $showingError) {
//                Button("OK") { }
//            } message: {
//                Text(errorMessage)
//            }
//            .overlay(
//                VStack {
//                    Spacer()
//                    HStack {
//                        Spacer()
//                        Text("Score: \(score)")
//                            .font(.headline)
//                            .padding()
//                            .background(Color.blue.opacity(0.2))
//                            .cornerRadius(10)
//                            .padding()
//                    }
//                }
//            )
//        }
//    }
//    
//    func addNewWord() {
//        // lowercase and trim the word, to make sure we don't add duplicate words with case differences
//        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
//        
//        // exit if the remaining string is empty
//        guard answer.count > 0 else { return }
//        
//        // Challenge 1: Disallow answers shorter than 3 letters
//        guard answer.count >= 3 else {
//            wordError(title: "Word too short", message: "Words must be at least 3 letters long!")
//            return
//        }
//        
//        // Challenge 1: Disallow the start word itself
//        guard answer != rootWord else {
//            wordError(title: "Word not allowed", message: "You can't use the start word!")
//            return
//        }
//        
//        guard isOriginal(word: answer) else {
//            wordError(title: "Word used already", message: "Be more original")
//            return
//        }
//        
//        guard isPossible(word: answer) else {
//            wordError(title: "Word not possible", message: "You can't spell that word from '\(rootWord)'!")
//            return
//        }
//        
//        guard isReal(word: answer) else {
//            wordError(title: "Word not recognized", message: "You can't just make them up, you know!")
//            return
//        }
//        
//        // Calculate score based on word length and add to total
//        let wordScore = answer.count * 10
//        score += wordScore
//        
//        withAnimation {
//            usedWords.insert(answer, at: 0)
//        }
//        newWord = ""
//    }
//    
//    func startGame() {
//        // Reset score and used words for new game
//        score = 0
//        usedWords.removeAll()
//        
//        // 1. Find the URL for start.txt in our app bundle
//        if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
//            // 2. Load start.txt into a string
//            if let startWords = try? String(contentsOf: startWordsURL) {
//                // 3. Split the string up into an array of strings, splitting on line breaks
//                let allWords = startWords.components(separatedBy: "\n")
//
//                // 4. Pick one random word, or use "silkworm" as a sensible default
//                rootWord = allWords.randomElement() ?? "silkworm"
//
//                // If we are here everything has worked, so we can exit
//                return
//            }
//        }
//
//        // If we are *here* then there was a problem – trigger a crash and report the error
//        fatalError("Could not load start.txt from bundle.")
//    }
//    
//    func isOriginal(word: String) -> Bool {
//        !usedWords.contains(word)
//    }
//    
//    func isPossible(word: String) -> Bool {
//        var tempWord = rootWord
//        
//        for letter in word {
//            if let pos = tempWord.firstIndex(of: letter) {
//                tempWord.remove(at: pos)
//            } else {
//                return false
//            }
//        }
//        
//        return true
//    }
//    
//    func isReal(word: String) -> Bool {
//        let checker = UITextChecker()
//        let range = NSRange(location: 0, length: word.utf16.count)
//        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
//        
//        return misspelledRange.location == NSNotFound
//    }
//    
//    func wordError(title: String, message: String) {
//        errorTitle = title
//        errorMessage = message
//        showingError = true
//    }
//}
//
//#Preview {
//    ContentView()
//} 
