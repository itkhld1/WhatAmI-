//
//  random.swift
//  WhatAmI?
//
//  Created by itkhld on 26.01.2025.
//

import SwiftUI

struct WordsView: View {
    
    @State private var timer: Timer?
    @State private var isBackgroundAnimating = false
    @Environment (\.dismiss) private var dismiss
    @State private var timeRemaining: Int
    @State private var showAlert = false
    @State private var showMenu = false
    @State private var showPlayAgain = false
    @State private var selectedWord: String
    @State private var originalGameTime: Int // Store original game time
    
    let category: Category
    let categoryWords: [String: [String]]

    
    init(selectedWord: String, gameTime: Int, category: Category, categoryWords: [String: [String]]) {
        self.category = category
        self.categoryWords = categoryWords
        self._selectedWord = State(initialValue: selectedWord)
        self._timeRemaining = State(initialValue: gameTime)
        self._originalGameTime = State(initialValue: gameTime)
    }
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                ZStack {
                    LinearGradient(gradient: Gradient(colors: isBackgroundAnimating ? [Color("q1"), Color("q2"), Color("q3"), Color("q4")] : [Color("q4"), Color("q3"), Color("q2"), Color("q1")]), startPoint: .topLeading, endPoint: .bottomTrailing)
                        .edgesIgnoringSafeArea(.all)
                        .animation(Animation.linear(duration: 5).repeatForever(autoreverses: true), value: isBackgroundAnimating)
                        .onAppear {
                            isBackgroundAnimating = true
                        }
                    
                    // ✅ Display Selected Word
                    HStack {
                        Text(selectedWord)
                            .id(selectedWord)
                            .font(.custom("Sabien", size: 70))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .multilineTextAlignment(.center)
                            .shadow(color: .purple, radius: 1, y: 3)
                            .shadow(color: .black, radius: 1, y: 4)
                            .rotationEffect(.degrees(90))
                    }
                    .padding()
                    
                    VStack {
                        Button(action: {
                            showAlert = true
                            SoundManagerWav.shared.playSound(named: "click2")
                        }, label: {
                            Image(systemName: "gear")
                                .font(.custom("Sabien", size: 25))
                                .foregroundColor(.white)
                                .shadow(color: .purple, radius: 1, y: 3)
                                .shadow(color: .black, radius: 1, y: 4)
                                .rotationEffect(.degrees(90))
                        })
                    }
                    .padding(.top, 650)
                    .padding(.leading, 250)
                    
                    Spacer()
                    
                    // ✅ Display Timer
                    ZStack {
                        Text(formatTime(seconds: timeRemaining))
                            .font(.custom("Sabien", size: 50))
                            .foregroundColor(.white)
                            .frame(maxHeight: .infinity)
                            .shadow(color: .purple, radius: 1, y: 3)
                            .shadow(color: .black, radius: 1, y: 4)
                            .rotationEffect(.degrees(90))
                    }
                    .padding(.leading, 250)
                }
                
                // ✅ Start Timer on Appear
                .onAppear {
                    startTimer()
                }
                
                .onChange(of: showPlayAgain) { newValue in
                    if newValue {
                        SoundManager.shared.playSound(named: "ding") // Play sound
                    }
                }
                
                // ✅ Show Play Again Modal
                .fullScreenCover(isPresented: $showPlayAgain) {
                    PlayAgain(
                        previousWord: selectedWord,
                        //onPlayAgain: restartGame,
                        onSelectNewCategory: { dismiss() }
                    )
                }
                
                // ✅ Show Exit Confirmation
                if showAlert {
                    ZStack {
                        Color.black.opacity(0.6)
                            .blur(radius: 25)
                            .ignoresSafeArea()
//                            .onTapGesture {
//                                showAlert = false
//                            }
                        
                        VStack(spacing: 20) {
                            Text("Setting")
                                .font(.custom("Sabien", size: 35))
                                .foregroundColor(.white)
                                .shadow(color: .purple, radius: 1, y: 3)
                                .shadow(color: .black, radius: 1, y: 4)
                            
                            Text("Exit Game, Skip Word or Add Extra Time")
                                .font(.custom("Sabien", size: 20))
                                .foregroundColor(.white)
                                .frame(width: 300)
                                .shadow(color: .purple, radius: 1, y: 3)
                                .shadow(color: .black, radius: 1, y: 4)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                            
                            VStack {
                                HStack(spacing: 50) {
                                    Button(action: {
                                        SoundManagerWav.shared.playSound(named: "click2")
                                        skipWord()
                                        showAlert = false
                                        
                                    }) {
                                        Text("Skip Word")
                                            .font(.custom("Sabien", size: 20))
                                            .padding()
                                            .background(Color("q1").opacity(0.5))
                                            .foregroundColor(.white)
                                            .cornerRadius(20)
                                            .shadow(color: .purple, radius: 1, y: 3)
                                            .shadow(color: .black, radius: 1, y: 4)
                                    }
                                    
                                    Button(action: {
                                        SoundManagerWav.shared.playSound(named: "click2")
                                        addExtraTime()
                                        showAlert = false
                                    }) {
                                        Text("Extra Time")
                                            .font(.custom("Sabien", size: 20))
                                            .padding()
                                            .background(Color("q2"))
                                            .foregroundColor(.white)
                                            .cornerRadius(20)
                                            .shadow(color: .purple, radius: 1, y: 3)
                                            .shadow(color: .black, radius: 1, y: 4)
                                    }
                                }
                                .frame(maxHeight: .infinity)
                                .frame(width: 350)
                                
                                HStack(spacing: 50) {
                                    Button(action: {
                                        SoundManagerWav.shared.playSound(named: "click2")
                                        showAlert = false
                                    }) {
                                        Text("Resume    ")
                                            .font(.custom("Sabien", size: 20))
                                            .padding()
                                            .background(Color("q3"))
                                            .foregroundColor(.white)
                                            .cornerRadius(20)
                                            .shadow(color: .purple, radius: 1, y: 3)
                                            .shadow(color: .black, radius: 1, y: 4)
                                    }
                                    
                                    Button(action: {
                                        dismiss()
                                        SoundManager.shared.playSound(named: "notify") // Play sound
                                    }) {
                                        Text("Exit Game")
                                            .font(.custom("Sabien", size: 20))
                                            .padding()
                                            .background(Color(.red).opacity(0.5))
                                            .foregroundColor(.white)
                                            .cornerRadius(20)
                                            .shadow(color: .purple, radius: 1, y: 3)
                                            .shadow(color: .black, radius: 1, y: 4)
                                    }
                                }
                                .frame(maxHeight: .infinity)
                                .frame(width: 350)
                            }
                        }
                        .padding()
                        .background(Color("q1"))
                        .cornerRadius(40)
                        .shadow(radius: 30)
                        .frame(width: 300, height: 300)
                        .rotationEffect(.degrees(90))
                    }
                    .animation(.easeInOut, value: showAlert)
                }
            }
        }
    }
    
    // ✅ Restart Game with New Random Word
    func restartGame() {
        showPlayAgain = false
        timeRemaining = originalGameTime  // ✅ Reset timer properly
        
        if let words = categoryWords[category.name], words.count > 1 {
            var newWord: String
            repeat {
                newWord = words.randomElement() ?? selectedWord
            } while newWord == selectedWord  // Ensure a new word is chosen
            selectedWord = newWord
        } else {
            selectedWord = categoryWords[category.name]?.randomElement() ?? selectedWord
        }
        
        // ✅ Restart timer countdown
        startTimer()
    }
    
    // ✅ Timer Function with Auto-Show Play Again
    func startTimer() {
        timer?.invalidate()  // ✅ Stop previous timer if any
        timeRemaining = originalGameTime  // ✅ Reset time
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            if timeRemaining > 0 {
                timeRemaining -= 1
            } else {
                timer.invalidate()
                showPlayAgain = true  // ✅ Show Play Again when timer reaches 0
            }
        }
    }
    
    // ✅ Format Time Function
    private func formatTime(seconds: Int) -> String {
        let minutes = seconds / 60
        let seconds = seconds % 60
        return String(format: "%d:%02d", minutes, seconds)
    }
    
    
    func addExtraTime() {
        timeRemaining += 15
    }
    
    func skipWord() {
        print("Selected category:", category.name)
        print("Available categories in dictionary:", categoryWords.keys)

        // Ensure the category exists in the dictionary
        guard let words = categoryWords[category.name], !words.isEmpty else {
            print("No words available for category:", category.name, "or category does not exist.")
            return
        }

        // If there's only one word, no need to skip
        if words.count == 1 {
            print("Only one word available, can't change.")
            return
        }

        // Filter out the selected word to ensure a new word is chosen
        let filteredWords = words.filter { $0 != selectedWord }
        guard !filteredWords.isEmpty else {
            print("All words in the category are the same.")
            return
        }

        // Select a new word
        let newWord = filteredWords.randomElement()!

        print("Old word: \(selectedWord), New word: \(newWord)")

        // Update the selectedWord state
        selectedWord = newWord
    }
}

#Preview {
    WordsView(selectedWord: "AnimalPlusAnimal", gameTime: 120, category: Category(name: "Animals", imageName: "animals_icon", description: "Animal-related words"), categoryWords: ["Animals": ["Lion", "Tiger", "Elephant"]])
}
